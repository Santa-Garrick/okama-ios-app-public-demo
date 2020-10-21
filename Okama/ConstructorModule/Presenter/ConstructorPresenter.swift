//
//  ConstructorPresenter.swift
//  Okama
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class ConstructorPresenter: ConstructorPresenting {
	
	var portfolio: Portfolio
	private(set) var availableDates: DateInterval? {
		didSet {
			portfolio.startDate = availableDates?.start
		}
	}
	
	var assetsView: AssetsDisplaying?
	var conditionsView: ConditionsDisplaying?
	var actionsView: ActionsDisplaying?
	
	private var dateRangeHelper: DateRangeManager!
	private var analyzer: AnalysisFetching
	private var mutationService: Mutating

	required init(portfolio: Portfolio?,
					  analyzer: AnalysisFetching,
					  dateRangeFetcher: AvailableDatesFetching,
					  mutationService: Mutating) {
		
		self.portfolio = portfolio ?? Portfolio.empty
		self.analyzer = analyzer
		self.dateRangeHelper = DateRangeManager(with: dateRangeFetcher)
		self.mutationService = mutationService

		dateRangeHelper.delegate = self
		
		if let portfolio = portfolio {
			_ = portfolio.assets.map({ $0.asset }).map {
				dateRangeHelper.add(asset: $0)
			}
			updateViews()
		}
		
	}
	
	private var isLoadingDates: Bool = false
	private var isLoadingAnalysis: Bool = false
	
	private var state: UIState {
		if portfolio.assets.isEmpty {
			return .noAssets
		} else if isLoadingDates {
			return .dateRangeLoading
		} else if availableDates == nil {
			return .noAvailableDates
		} else if isLoadingAnalysis {
			return .analyzing
		} else if portfolio.analysis != nil {
			return .analysisIsReady
		} else {
			return .readyToAnalyze
		}
	}
	
	func updateAssets() {
		assetsView?.display(assets: portfolio.assets)
	}
	
	func updateConditions() {
		conditionsView?.setUI(state)
		conditionsView?.display(date: portfolio.startDate?.uiString ?? "")
		conditionsView?.display(amount: portfolio.initialAmount.roundedString,
										currency: portfolio.currency)
	}
	
	func updateActions() {
		
		if portfolio.uuid != nil {
			actionsView?.setActionsButtonToExtendedMode()
		} else {
			actionsView?.setActionsButtonToSaveMode()
		}
		
		if state == .noAssets ||
			state == .dateRangeLoading ||
			state == .noAvailableDates {
			
			actionsView?.hideActionsButton()
		} else {
			actionsView?.showActionsButton()
		}
	}
	
	private func updateViews() {
		updateAssets()
		updateConditions()
		updateActions()
	}
	
	func addAsset(_ asset: Asset) {
		let weighedAsset = WeighedAsset(asset: asset,
												  weight: 0)
		portfolio.input.assets.append(weighedAsset)
		dateRangeHelper.add(asset: asset)
		updateViews()
	}
	func getWeight(forAssetAtIndex index: Int) -> Double {
		return portfolio.input.assets[index].weight
	}
	func setWeight(_ weight: Double, forAssetAtIndex index: Int) {
		portfolio.input.assets[index].weight = weight
		updateViews()
	}
	
	func remove(assetAtindex index: Int) {
		let asset = portfolio.input.assets[index].asset
		dateRangeHelper.remove(asset: asset)
		portfolio.input.assets.remove(at: index)
		updateViews()
	}
	
	func setDate(_ date: Date) {
		portfolio.startDate = date
		updateViews()
	}
	
	func setAmount(_ amount: Double) {
		portfolio.initialAmount = amount
		updateViews()
	}
	
	func setCurrency(_ currency: Currency) {
		portfolio.currency = currency
		updateViews()
	}
	
	func analyze() {
		portfolio.input.normalizeWeights()
		updateAssets()
		
		isLoadingAnalysis = true
		updateConditions()
		
		let assets = portfolio.assets
		let conditions = portfolio.input.conditions
		
		analyzer.makePortfolioQuery(weighedAssets: assets,
											 conditions: conditions) { [weak self] (result) in
												self?.isLoadingAnalysis = false
												
												switch result {
													
												case .success(let analysis):
													self?.portfolio.input.assets = analysis.weighedAssets
													self?.portfolio.analysis = analysis
													
												case .failure(let error):
													print(error)
													self?.actionsView?.showFailureAlert(message: "Can not load analysis")
												}
												self?.updateViews()
		}
	}

	private func handleMutationError(_ error: NetworkError) {
		if error == .userNotAuthorized {
			actionsView?.goToAuth()
		} else if error == .portfoliosAmountExceeded {
			actionsView?.showFailureAlert(message: "You got maximum number of portfolios (5)")
		} else {
			print(error)
			actionsView?.showFailureAlert(message: "Some error occurs")
		}
	}
	func saveTapped() {
		actionsView?.showLoading(with: "Saving...")
		let input = portfolio.input
		mutationService.createPortfolio(input: input) { [weak self] (result) in
			
			guard let self = self else { return }
			
			self.actionsView?.hideLoading()
			switch result {
				
			case .success(let id):
				self.portfolio.uuid = id
				self.updateViews()
			case .failure(let error):
				self.handleMutationError(error)
			}
		}
	}
	
	func updateTapped() {
		actionsView?.showLoading(with: "Updating...")
		guard let uuid = portfolio.uuid else {
			return
		}
		let input = portfolio.input

		mutationService
			.updatePortfolio(uuid: uuid,
								  input: input) { [weak self] result in
									guard let self = self else { return }
									self.actionsView?.hideLoading()

									switch result {
										
									case .success:
										self.updateViews()
									case .failure(let error):
										self.handleMutationError(error)
									}
		}
	}
	
	func deleteTapped() {
		actionsView?.showLoading(with: "Deleting...")
		guard let uuid = portfolio.uuid else {
			return
		}
		mutationService.deletePortfolio(id: uuid) { [weak self] result in
			
			guard let self = self else { return }
			self.actionsView?.hideLoading()

			switch result {
				
			case .success:
				self.portfolio.uuid = nil
				self.updateViews()
			case .failure(let error):
				self.handleMutationError(error)
			}
		}
	}
	
	var initialAmount: Double {
		return portfolio.initialAmount
	}
	var currency: Currency {
		return portfolio.currency
	}
	
}


extension ConstructorPresenter: DateRangeManagerDelegate {
	func startUpdating() {
		isLoadingDates = true
		updateViews()
	}
	
	func dateRangeDidUpdate(result: Result<DateInterval, Error>) {
		isLoadingDates = false

		switch result {
		case .success(let interval):
			availableDates = interval
		case .failure(_):
			availableDates = nil
		}
		updateViews()
	}
}

extension ConstructorPresenter: SearchDelegate {
	func addAssets(_ assets: [Asset]) {
		_ = assets.map{ self.addAsset($0)}
	}
}
