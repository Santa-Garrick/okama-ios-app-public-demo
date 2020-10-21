//
//  AuthViewControllerProtocol.swift
//  Okama
//
//  Created by Pro13 on 10.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


typealias LoginCredentials = (email: String, password: String)
typealias LoginAlertHandler = (LoginCredentials) -> Void
typealias RegisterCredentials = (email: String, password: String, confirm: String)
typealias RegisterAlertHandler = (RegisterCredentials) -> Void

protocol AuthViewControllerProtocol: UIViewController {
   func loginAlert(handler: @escaping LoginAlertHandler) -> UIAlertController
   func registerAlert(handler: @escaping RegisterAlertHandler) -> UIAlertController
}

extension AuthViewControllerProtocol {
   
   func loginAlert(handler: @escaping LoginAlertHandler) -> UIAlertController {
      
      let alert = UIAlertController(title: "Login",
                                    message: "Enter your email and password",
                                    preferredStyle: .alert)
      alert.addTextField { (textField) in
         textField.becomeFirstResponder()
         textField.textColor = UIColor.mainText
         textField.font = .systemFont(ofSize: 16, weight: .regular)
         textField.placeholder = "E-mail"
         
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .emailAddress
         textField.isSecureTextEntry = false
         textField.returnKeyType = .done
         textField.textContentType = .emailAddress
         
      }
      alert.addTextField { (textField) in
         textField.textColor = UIColor.mainText
         textField.font = .systemFont(ofSize: 16, weight: .regular)
         textField.placeholder = "Password"
         
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .default
         textField.isSecureTextEntry = true
         textField.returnKeyType = .done
         textField.textContentType = .password

      }
      
      let okAction = UIAlertAction(title: "Login",
                                   style: .default) { (_) in
                                    
                                    guard
                                       let email = alert.textFields?[0].text,
                                       let password = alert.textFields?[1].text
                                       else { return }
                                    handler((email, password))
      }
      let cancelAction = UIAlertAction(title: "Cancel",
                                   style: .default)
      alert.addAction(okAction)
      alert.addAction(cancelAction)
      
      return alert
   }
   
   func registerAlert(handler: @escaping RegisterAlertHandler) -> UIAlertController {
      let alert = UIAlertController(title: "Registration",
                                    message: "Enter your email and password",
                                    preferredStyle: .alert)
      alert.addTextField { (textField) in
         textField.becomeFirstResponder()
         textField.textColor = UIColor.mainText
         textField.font = .systemFont(ofSize: 16, weight: .regular)
         textField.placeholder = "E-mail"
         
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .emailAddress
         textField.isSecureTextEntry = false
         textField.returnKeyType = .done
         textField.textContentType = .emailAddress

      }
      alert.addTextField { (textField) in
         textField.textColor = UIColor.mainText
         textField.font = .systemFont(ofSize: 16, weight: .regular)
         textField.placeholder = "Password"
         
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .default
         textField.isSecureTextEntry = true
         textField.returnKeyType = .done
         textField.textContentType = .password

      }
      alert.addTextField { (textField) in
         textField.textColor = UIColor.mainText
         textField.font = .systemFont(ofSize: 16, weight: .regular)
         textField.placeholder = "Confirm password"
         
         textField.backgroundColor = nil
         textField.keyboardAppearance = .default
         textField.keyboardType = .default
         textField.isSecureTextEntry = true
         textField.returnKeyType = .done
         textField.textContentType = .password

      }
      
      let okAction = UIAlertAction(title: "Register",
                                   style: .default) { (_) in
         
                                    guard
                                       let email = alert.textFields?[0].text,
                                       let password = alert.textFields?[1].text,
                                       let confirm = alert.textFields?[2].text
                                       else { return }
                                    handler((email: email,
                                             password: password,
                                             confirm: confirm))
                                    
      }
      let cancelAction = UIAlertAction(title: "Cancel",
                                   style: .default) { (_) in
                                    alert.dismiss(animated: true, completion: nil)
      }
      alert.addAction(okAction)
      alert.addAction(cancelAction)
      
      return alert
   }
}
