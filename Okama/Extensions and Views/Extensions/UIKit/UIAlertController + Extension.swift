//
//  UIAlertController + Extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

extension UIAlertController {
   
   convenience init(title: String?,
          message: String?,
          preferredStyle: UIAlertController.Style,
          actions: [UIAlertAction]) {
      self.init(title: title,
                message: message,
                preferredStyle: preferredStyle)
      
      _ = actions.map { self.addAction($0) }
   }
}

