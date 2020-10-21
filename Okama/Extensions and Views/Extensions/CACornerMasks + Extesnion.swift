//
//  CACornerMasks + Extesnion.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit



extension CACornerMask {
   static var forTableViewTopCell: CACornerMask {
      return [.layerMaxXMinYCorner, .layerMinXMinYCorner]
   }
   static var forTableViewBottomCell: CACornerMask {
      return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
   }
   static var forTableViewMiddleCell: CACornerMask {
      return []
   }
}




