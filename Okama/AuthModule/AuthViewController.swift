//
//  AuthViewController.swift
//  ChatTutorial
//
//  Created by Pro13 on 19.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit


class AuthViewController: ViewControllerWithLoadingView, AuthViewControllerProtocol {
	
   var auth: AuthServiceProtocol!
   
	let emailLabel = UILabel(text: "Please, sign in to save and view portfolios")
	let alreadyONboardLabel = UILabel(text: "Already onboard?")

   let registerButton = UIButton(title: "Register",
                                 titleColor: .mainText,
                                 backgroundColor: UIColor.secondaryBackground)
   let loginButton = UIButton(title: "Login",
                              titleColor: UIColor.buttonRed,
                              backgroundColor: .white)
   
	override func viewDidLoad() {
		super.viewDidLoad()
         
		view.backgroundColor = .mainBackground
		setupConstraints()
	
		registerButton.addTarget(self,
										 action: #selector(registerButtonTapped),
										 for: .touchUpInside)
		loginButton.addTarget(self,
									 action: #selector(loginButtonTapped),
									 for: .touchUpInside)
	}
	
	@objc private func loginButtonTapped() {
      let alert = loginAlert { (credentials) in
         self.loginTapped(withEmail: credentials.email,
                          andPassword: credentials.password)
      }
      present(alert, animated: true)
	}
   
	@objc private func registerButtonTapped() {
      let alert = registerAlert { (credentials) in
			self.registerTapped(withEmail: credentials.email,
                             andPassword: credentials.password,
                             confirm: credentials.confirm)
      }
      present(alert, animated: true)
	}
}

//MARK: Authorization
extension AuthViewController {
   
   func loginTapped(withEmail email: String,
                    andPassword password: String) {
		startLoadingAnimation(with: "Authorization...")
		auth.login(withEmail: email,
					  password: password) { [weak self] (result) in
						
						self?.stopLoadingAnimation()
						
						switch result {
						case .success(let user):
							self?.showAlert(withTitle: "Success!",
												 message: "You are signed in",
												 action: { self?.dismiss(animated: true,
																				 completion: nil) },
												 completion: {})
						case .failure(let error):
							self?.showAlert(withTitle: "Error!",
												 message: error.localizedDescription,
												 action: { self?.loginButtonTapped() },
												 completion: {})
						}
						
		}
		
	}
   func registerTapped(withEmail email: String,
                       andPassword password: String,
                       confirm: String) {
//      showAlert(withTitle: "Sorry!",
//                message: "This option is not available now. Try to create a new account on our web site")
		
		startLoadingAnimation(with: "Registration...")
		
		auth.register(withEmail: email,
						  password: password,
						  confirmPassword: confirm) { [weak self] result in
						
						self?.stopLoadingAnimation()
						
						switch result {
						case .success():
							self?.showAlert(withTitle: "Success!",
												 message: "You are registered. Please check your e-mail and confitm your registration",
												 action: { self?.dismiss(animated: true,
																				 completion: nil) },
												 completion: {})
						case .failure(let error):
							self?.showAlert(withTitle: "Error!",
												 message: error.localizedDescription,
												 action: { self?.registerButtonTapped() },
												 completion: {})
						}
						
		}
		
		
		
   }
   
}


//MARK: Constraints
extension AuthViewController {
	private func setupConstraints() {
		
		let emailView = ButtonFormView(label: emailLabel,
                                     button: registerButton,
                                     buttonHeight: 54)
		let loginView = ButtonFormView(label: alreadyONboardLabel,
                                     button: loginButton,
                                     buttonHeight: 54)

		let stackView = UIStackView(arrangedSubviews: [emailView, loginView],
                                  axis: .vertical,
                                  spacing: 40)
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor,
                                        constant: 160),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: 40),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -40),
		])
	}
}
