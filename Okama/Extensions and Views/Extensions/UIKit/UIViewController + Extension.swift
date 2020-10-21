//
//  UIViewController + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 24.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIViewController {
	
	
	func showAlert(withTitle title: String,
                  message: String,
                  action: @escaping (() -> Void) = {},
						completion: @escaping (() -> Void) = {}) {
      
		let alertController = UIAlertController(title: title,
                                              message: message,
                                              preferredStyle: .alert)
		let okAlertAction = UIAlertAction(title: "Ok",
                                        style: .default) { (_) in
			action()
		}
		alertController.addAction(okAlertAction)
		present(alertController, animated: true, completion: completion)
	}
	
	
}

extension UIViewController {
   func moveTabBarDuringOrientationChange() {
      if UIWindow.isLandscape {
         if !self.tabBarController!.tabBar.isHidden {
            self.tabBarController?.tabBar.isHidden = true
            UIView.transition(with: tabBarController!.view, duration: 0.35, options: .transitionCrossDissolve, animations: nil)
         }
         
      } else {
         if self.tabBarController!.tabBar.isHidden {
            self.tabBarController?.tabBar.isHidden = false
            UIView.transition(with: tabBarController!.view, duration: 0.35, options: .transitionCrossDissolve, animations: nil)
         }
         
      }
   }
   func moveNavigationBarDuringOrientationChange() {
      if UIWindow.isLandscape {
         if !self.navigationController!.isNavigationBarHidden {
            self.navigationController!.isNavigationBarHidden = true
            UIView.transition(with: navigationController!.view, duration: 0.35, options: .transitionCrossDissolve, animations: nil)
         }
         
      } else {
         if self.navigationController!.isNavigationBarHidden {
            self.navigationController!.isNavigationBarHidden = false
            UIView.transition(with: navigationController!.view, duration: 0.35, options: .transitionCrossDissolve, animations: nil)
         }
         
      }
   }
}


extension UIViewController {
   func presentAlert(_ alert: UIAlertController) {
      alert.show()
   }
   func presentAlertWithVC(_ vc: UIViewController, title: String) {
      
      let alert = UIAlertController(style: .actionSheet,
                                    title: title)
      
      alert.set(vc: vc, height: 120)
      
      let okAction = UIAlertAction(title: "Ok", style: .default)
      alert.addAction(okAction)
      presentAlert(alert)
   }
}


extension UIViewController {
   func showEditWeightAlert(initialValue: Double,
                              action: @escaping (Double) -> Void) {
      
      var weight = initialValue
         
      let alert = UIAlertController(style: .alert,
                                    title: K.Title.enterWeight)
      let config: TextField.Config = { textField in
         textField.becomeFirstResponder()
         textField.textColor = .mainText
         textField.placeholder = ""
         textField.leftViewPadding = 12
         textField.borderWidth = 1
         textField.cornerRadius = 8
         textField.text = weight.roundedPercentage
         textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .numberPad
         textField.returnKeyType = .done
         
         textField.action { textField in
            textField.updateTextForPercentage(with: weight)
            weight = textField.numberOrZero / 100
            
            action(weight)
         }
      }
      let textfield = alert.addOneTextField(configuration: config)
      
      alert.addAction(title: "Close", style: .cancel)
      
      alert.show(animated: true) {
         textfield.selectAll(nil)
      }
      
   }
}


