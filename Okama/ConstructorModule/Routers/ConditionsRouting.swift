//
//  ConditionsRouting.swift
//  Okama
//
//  Created by Pro13 on 23.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject


protocol ConditionsRouting: Routing {
	func routeToAnalysis()
   func routeToEditDate()
   func routeToEditAmount()
}


class ConditionsRouter: ConditionsRouting {
		
	weak var viewController: UIViewController!
	
	private let container: Container
	
	private var presenter: ConstructorPresenting? {
		guard
			let vc = viewController as? ConditionsViewController,
			let presenter = vc.presenter
		else { return nil }
		return presenter
	}
	
	required init(with container: Container) {
		self.container = container
	}
	
	func routeToAnalysis() {
		guard
			let presenter = presenter,
			let analysis = presenter.portfolio.analysis
			else { return }
		
		container.register(PortfolioAnalysis.self) { _ in analysis }
		
		let vc = AnalysisConfigurator.init(withContainer: container).makeModule()
		vc.modalPresentationStyle = .fullScreen
		viewController.present(vc, animated: true, completion: nil)
	}
	
	func routeToEditDate() {
		guard let presenter = presenter else { return }
		
		let date = presenter.portfolio.startDate
		let minDate = presenter.availableDates?.start
		let maxDate = presenter.availableDates?.end
		
		let title = "Choose date from \(minDate?.uiString ?? "") till \(maxDate?.uiString ?? "")"
		let alert = UIAlertController(style: .alert,
												title: title)
		alert.addMonthYearPicker(mode: .date,
										 date: date,
										 minimumDate: minDate,
										 maximumDate: maxDate) { date in
											presenter.setDate(date)
		}
		
		alert.addAction(title: "OK", style: .cancel)
		
		viewController.present(alert, animated: true)
		
	}
	
	func routeToEditAmount() {
		guard let presenter = presenter else { return }
		
		let alert = UIAlertController(style: .alert, title: "Enter initial amount")
		let vc = EditAmountViewController()
		vc.presenter = presenter
		alert.set(vc: vc, height: 120)
		
		alert.addAction(title: "OK", style: .cancel)
		
		viewController.present(alert, animated: true)
		
	}

	
	
}
