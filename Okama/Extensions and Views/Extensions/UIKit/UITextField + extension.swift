//
//  UITextField + extension.swift
//  Okama
//
//  Created by Pro13 on 28.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UITextField {
   var numberOrZero: Double {
      guard let text = text else {
         return 0
      }
      return Double(text) ?? 0
   }
   func updateTextForPercentage(with current: Double) {
      let number = self.numberOrZero / 100
      
      let updated = number > 1 ? current : number
      
      text = updated.roundedPercentage
   }
}

extension UITextField {
   func setLeftPaddingPoints(_ amount:CGFloat){
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
      self.leftView = paddingView
      self.leftViewMode = .always
   }
   func setRightPaddingPoints(_ amount:CGFloat) {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
      self.rightView = paddingView
      self.rightViewMode = .always
   }
}
