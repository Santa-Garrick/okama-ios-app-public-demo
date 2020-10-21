//
//  UIBarButtonItem + Extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
   
   convenience init(title: String?,
                    style: UIBarButtonItem.Style,
                    target: Any?,
                    nonObjCAction: @escaping () -> Void) {
      self.init(title: title,
                style: style,
                target: target,
                action: nil)
      actionHandler {
         nonObjCAction()
      }
   }
   
   private func actionHandler(action:(() -> Void)? = nil) {
      
      struct __ {
         static var action :(() -> Void)?
      }
      
      if action != nil {
         __.action = action
      } else {
         __.action?()
      }
   }
   
   @objc private func triggerActionHandler() {
      self.actionHandler()
   }
   
   func actionHandler(forAction action: @escaping () -> Void) {
      self.actionHandler(action: action)
      
      self.target = self
      self.action = #selector(triggerActionHandler)
   }
}
