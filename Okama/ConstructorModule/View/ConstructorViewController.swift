//
//  BaseConstructorViewController.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class ConstructorViewController: ViewControllerWithLoadingView, ActionsDisplaying {
   
   // dependencies
   var presenter: ConstructorPresenting!
	
   
   // children vc
	var assetsVC: (AssetsDisplaying & UIViewController)!
   var conditionsVC: (ConditionsDisplaying & UIViewController)!
	
	var authVC: UIViewController!
	
   var rightButton: UIBarButtonItem!

   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
		rightButton = createSaveButton(saveAction: presenter.saveTapped)
      setupLayout()
		
   }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presenter.updateActions()
	}
   
   func showActionsButton() {
		navigationItem.setRightBarButton(rightButton, animated: true)
   }
   
   func hideActionsButton() {
		navigationItem.rightBarButtonItem = nil
   }
   
   func setActionsButtonToSaveMode() {
      rightButton = createSaveButton(saveAction: presenter.saveTapped)
   }
   
   func setActionsButtonToExtendedMode() {

      rightButton = createActionsButton(saveAction: presenter.saveTapped,
                                        updateAction: presenter.updateTapped,
                                        deleteAction: presenter.deleteTapped)
   }
   
   func showSuccessAlert() {
      showAlert(withTitle: "Success!", message: "")
   }
   
   func showConfirmAlert(completion: @escaping (Bool) -> Void) {
      let alert = createConfirmAlert(completion: completion)
      show(alert, sender: self)
   }
   
   func goToAuth() {
      present(authVC, animated: true)
   }
   
   func showFailureAlert(message: String) {
      showAlert(withTitle: "Failure!", message: message)
   }
	
	func showLoading(with message: String) {
		startLoadingAnimation(with: message)
	}
	func hideLoading() {
		stopLoadingAnimation()
	}

   
}


// MARK: - UI
extension ConstructorViewController {
   private func setupLayout() {
      
      add(asChildViewController: assetsVC)
      add(asChildViewController: conditionsVC)
      
      assetsVC.view.translatesAutoresizingMaskIntoConstraints = false
      conditionsVC.view.translatesAutoresizingMaskIntoConstraints = false
      let margins = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
         assetsVC.view.topAnchor.constraint(equalTo: margins.topAnchor),
         assetsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         assetsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         
         conditionsVC.view.topAnchor.constraint(equalTo: assetsVC.view.bottomAnchor),
         conditionsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         conditionsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         conditionsVC.view.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
         conditionsVC.view.heightAnchor.constraint(equalToConstant: 120)
      ])
   }
   private func add(asChildViewController viewController: UIViewController) {
      addChild(viewController)
      view.addSubview(viewController.view)
      viewController.didMove(toParent: self)
   }
   
   private func remove(asChildViewController viewController: UIViewController) {
      viewController.willMove(toParent: nil)
      viewController.view.removeFromSuperview()      
      viewController.removeFromParent()
   }
   
}
