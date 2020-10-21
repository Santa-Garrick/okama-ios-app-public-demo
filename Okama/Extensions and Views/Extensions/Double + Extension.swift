//
//  Double + Extension.swift
//  Okama
//
//  Created by Pro13 on 30.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

extension Double {
   var percentageString: String {
      let a = self * 100.0 * 100.0
      let b = a.rounded()
      let percentage = b / 100
      
      return "\(percentage)%"
   }
   
   var roundedPercentage: String {
      let percentage = Int(self * 100.0)
      
      return "\(percentage)"
   }
   
   var roundedString: String {
      let a = self * 100.0
      let b = a.rounded()
      let rounded = b / 100
      
      return "\(rounded)"
   }
   var roundedIfPossibleString: String {
      if (self.rounded() - self) < 0.000001 {
         return roundedString
      } else {
         return "\(self)"
      }
   }
}

extension Optional where Wrapped == Double {
   var percentageString: String {
      guard let unwrapped = self else { return "no value" }
      
      return unwrapped.percentageString
   }
   var roundedString: String {
      guard let unwrapped = self else { return "no value" }
      
      return unwrapped.roundedString
   }
}

