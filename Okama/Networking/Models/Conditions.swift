//
//  Conditions.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public struct Conditions: Codable {
   var startDate: Date?
   var currency: Currency = .usd
   var initialAmount: Double = 100
   
   mutating func limit(byInterval interval: DateInterval?) {
      guard let interval = interval else {
         return
      }
      if startDate == nil {
         startDate = interval.start
         return
      }
      
      if startDate! < interval.start {
         startDate = interval.start
      } else if interval.end < startDate! {
         startDate = interval.end
      }
      
   }
}

extension Currency: Codable {
   
}

