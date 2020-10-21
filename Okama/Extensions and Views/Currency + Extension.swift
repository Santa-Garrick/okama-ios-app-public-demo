//
//  Currency + Extension.swift
//  Okama
//
//  Created by Pro13 on 21.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

extension Currency {
   init?(fromCaseIndex index: Int) {
      if Currency.allCases.indices.contains(index) {
         self = Currency.allCases[index]
      } else {
         return nil
      }
      
   }
}

extension Currency {
   var title: String {
      switch self {
      case .rub:
         return "₽"
      case .usd:
         return "$"
      case .eur:
         return "€"
      case .__unknown(_):
         return ""
      }
   }
   var caseIndex: Int {
      return Currency.allCases.firstIndex(of: self)!
   }
}

