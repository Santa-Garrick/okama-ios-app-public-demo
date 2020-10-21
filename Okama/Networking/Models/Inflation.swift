//
//  Inflation Models.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public struct Inflation {
   let currency: Currency
   var monthsInflations: [TimeSeriesValue]?
   var yoyInflations: [TimeSeriesValue]?
   var values: [ValuesByYear]?
}

public struct ValuesByYear {
   let year: Int
   let values: [TimeSeriesValue]
   let cumulative: Double
}

public extension ValuesByYear {
   func value(forMonth month: Int) -> Double? {
      values.filter {
         $0.period.monthNumber == month
      }.first?.value
   }
}

