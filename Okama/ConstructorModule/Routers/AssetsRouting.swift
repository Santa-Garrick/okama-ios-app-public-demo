//
//  AssetsRouting.swift
//  Okama
//
//  Created by Pro13 on 23.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject


protocol AssetsRouting: Routing {
	func routeToSearch()
	func routeToEditWeight(atIndex index: Int)
}

class AssetsRouter: AssetsRouting {
	
	weak var viewController: UIViewController!
	
	private let container: Container
	
	required init(with container: Container) {
		self.container = container
	}
	
	func routeToSearch() {
		
		let presenter = (viewController as! AssetsViewController).presenter!
		container.register(SearchDelegate.self) { _ in
			return presenter
		}
		let config = SearchConfigurator(withContainer: container)
		let vc = config.makeModule()
		viewController.present(vc, animated: true, completion: nil)
	}
	
	func routeToEditWeight(atIndex index: Int) {

		let presenter = (viewController as! AssetsViewController).presenter!
		
		let alert = UIAlertController(title: "Set weight",
												message: "",
												preferredStyle: .alert)
		var weight = presenter.getWeight(forAssetAtIndex: index)
		
		var textFieldToSelect: UITextField?
		
		let config: TextField.Config = { textField in
			textFieldToSelect = textField
			textField.becomeFirstResponder()
			textField.textColor = .mainText
			textField.placeholder = ""
			textField.leftViewPadding = 12
			textField.borderWidth = 1
			textField.cornerRadius = 8
			textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
			textField.backgroundColor = nil
			textField.keyboardAppearance = .default
			textField.keyboardType = .decimalPad
			textField.returnKeyType = .done
			
			textField.text = weight.roundedPercentage
			
			textField.action { textField in
				textField.updateTextForPercentage(with: weight)
				weight = textField.numberOrZero / 100.0
				presenter.setWeight(weight, forAssetAtIndex: index)
			}
		}
		_ = alert.addOneTextField(configuration: config)
		
		alert.addAction(title: "OK", style: .cancel)
		
		viewController.present(alert, animated: true) {
			textFieldToSelect?.selectAll(nil)
		}
	}
	
	
}
