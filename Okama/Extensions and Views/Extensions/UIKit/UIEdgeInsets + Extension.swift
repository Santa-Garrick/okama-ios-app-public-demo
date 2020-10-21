//
//  UIEdgeInsets + Extension.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
   var forTableViewTopCell: UIEdgeInsets {
      return UIEdgeInsets(top: self.top,
                          left: self.left,
                          bottom: 0,
                          right: self.right)
   }
   var forTableViewBottomCell: UIEdgeInsets {
      return UIEdgeInsets(top: 0,
                          left: self.left,
                          bottom: self.bottom,
                          right: self.right)
   }
   var forTableViewMiddleCell: UIEdgeInsets {
      return UIEdgeInsets(top: 0,
                          left: self.left,
                          bottom: 0,
                          right: self.right)
   }
}
