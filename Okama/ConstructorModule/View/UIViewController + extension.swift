//
//  UIViewController + extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

extension UIViewController {
   
   func createConfirmAlert(completion: @escaping (Bool) -> Void) -> UIAlertController {
      let okAction = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: { _ in
                                    completion(true)
      })
      let cancelAction = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: { _ in
                                    completion(false)
      })
      return UIAlertController(title: "Are you sure?",
                               message: "",
                               preferredStyle: .alert,
                               actions: [okAction,
                                         cancelAction])
   }
   
   func createSaveButton(saveAction: @escaping () -> Void) -> UIBarButtonItem {
      let button = UIBarButtonItem(title: "Save",
                                   style: .done,
                                   target: self,
                                   action: nil)
      
      button.actionHandler {
         saveAction()
      }
      
      return button
   }
   
   func createActionsButton(saveAction: @escaping () -> Void,
                            updateAction: @escaping () -> Void,
                            deleteAction: @escaping () -> Void) -> UIBarButtonItem {
      
      let button = UIBarButtonItem(title: "Actions",
                                   style: .done,
                                   target: self,
                                   action: nil)
      button.actionHandler { [weak self] in
         self?.showActionsAlert(saveAction: saveAction,
                                updateAction: updateAction,
                                deleteAction: deleteAction)
      }
      return button
   }
   
   
   func showActionsAlert(saveAction: @escaping () -> Void,
                         updateAction: @escaping () -> Void,
                         deleteAction: @escaping () -> Void) {
      let alert = createActionsAlert(saveAction: saveAction,
                                     updateAction: updateAction,
                                     deleteAction: deleteAction)
      present(alert, animated: true)
   }
   
   private func createActionsAlert(saveAction: @escaping () -> Void,
                                   updateAction: @escaping () -> Void,
                                   deleteAction: @escaping () -> Void) -> UIAlertController {
      
      
      let saveAction = UIAlertAction(
         title: "Save",
         style: .default
      ) { (_) in
         saveAction()
      }
      let updateAction = UIAlertAction(
         title: "Update",
         style: .default
      ) { (_) in
         updateAction()
      }
      let deleteAction = UIAlertAction(
         title: "Delete",
         style: .default
      ) { (_) in
         deleteAction()
      }
      let cancelAction = UIAlertAction(title: "Cancel",
                                       style: .default) { (_) in
                                          self.dismiss(animated: true)
      }
      
      let actions = [
         saveAction,
         updateAction,
         deleteAction,
         cancelAction
      ]
      
      return UIAlertController(title: "Actions",
                               message: "",
                               preferredStyle: .alert,
                               actions: actions)
   }
   
}
