//
//  ActionsDisplaying.swift
//  Okama
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


protocol ActionsDisplaying: class {
   func setActionsButtonToSaveMode()
   func setActionsButtonToExtendedMode()
   func showActionsButton()
   func hideActionsButton()
	
	func showLoading(with message: String)
	func hideLoading()

   func showSuccessAlert()
   func showFailureAlert(message: String)
   func showConfirmAlert(completion: @escaping (Bool) -> Void)
   
   func goToAuth()
}
