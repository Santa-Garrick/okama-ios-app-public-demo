//
//  File.swift
//  Okama
//
//  Created by Pro13 on 13.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

enum ChartColors {
   case portfolio
   case inflation
   case asset(index: Int)
   
   var color: UIColor {
      switch self {
         
      case .portfolio:
         return .mainText
      case .inflation:
         return .systemBlue
      case .asset(index: let index):
         return colors[index]
      }
   }
   
   private var colors: [UIColor] {
      return [
         .systemRed,
         .systemPink,
         .systemGreen,
         .systemTeal,
         .systemOrange,
         .systemYellow
      ]
   }
   
   static let positiveColor = UIColor.systemTeal
   static let negativeColor = UIColor.systemRed
}

