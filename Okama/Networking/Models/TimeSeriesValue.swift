//
//  TimeSeriesValue.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public struct TimeSeriesValue {
   let period: Date
   let value: Double
   
   init(period: Date, value: Double) {
      self.period = period
      self.value = value
   }
   
   init?(period: Date?, value: Double?) {
      guard let period = period,
            let value = value
         else { return nil }
      self.period = period
      self.value = value
   }
}

