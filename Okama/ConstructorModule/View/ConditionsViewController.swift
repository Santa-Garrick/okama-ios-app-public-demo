//
//  ConditionsViewController.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

enum UIState {
   case noAssets
	
   case dateRangeLoading
	case noAvailableDates

   case readyToAnalyze
      
   case analyzing
   case analysisIsReady
}


class ConditionsViewController: UIViewController {
      
   var presenter: ConstructorPresenting!
   var router: ConditionsRouting!
	
	var buttonsView: ConstructorButtonsView!
   
	override func viewDidLoad() {
		super.viewDidLoad()
		buttonsView = ConstructorButtonsView()
		buttonsView.delegate = self
		view.addSubview(buttonsView)
		buttonsView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			buttonsView.topAnchor.constraint(equalTo: view.topAnchor),
			buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
	}
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      presenter.updateConditions()
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		buttonsView.needsUpdateConstraints()
	}
}

extension ConditionsViewController: ConditionsDisplaying {
	func display(date: String) {
		buttonsView.display(date: date)
	}
	func display(amount: String, currency: Currency) {
		buttonsView.display(amount: amount, currency: currency)
	}
	func setUI(_ state: UIState) {
		buttonsView.setUI(state)
	}
}


extension ConditionsViewController: ConstructorButtonsViewDelegate {
	func analyzeTapped() {
      presenter.analyze()
   }
	func showAnalysisTapped() {
      router.routeToAnalysis()
   }
	func datePressed() {
      router.routeToEditDate()
   }
	func amountPressed() {
      router.routeToEditAmount()
   }
}

