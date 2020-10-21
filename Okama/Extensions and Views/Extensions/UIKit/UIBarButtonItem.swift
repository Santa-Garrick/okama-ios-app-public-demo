//
//  UIBarButtonItem.swift
//  Okama
//
//  Created by Pro13 on 04.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit



extension UIBarButtonItem {
   func set(fontSize: CGFloat) {
      
      let font: UIFont = UIFont.boldSystemFont(ofSize: fontSize)
      let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font]
      setTitleTextAttributes(attributes,
                                 for: .normal)
   }
}
