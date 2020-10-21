//
//  UIActivityIndicatorView + Extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UIActivityIndicatorView {
   convenience init(color: UIColor? = nil, hidesWhenStopped: Bool = false) {
      self.init(frame: .zero)
      self.hidesWhenStopped = hidesWhenStopped
      self.color = color
   }
}
