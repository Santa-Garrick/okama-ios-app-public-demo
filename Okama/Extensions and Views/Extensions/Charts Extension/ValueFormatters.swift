//
//  ValueFormatters.swift
//  Okama
//
//  Created by Pro13 on 07.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

class DateAxisValueFormatter: IAxisValueFormatter {
   func stringForValue(_ value: Double, axis: AxisBase?) -> String {
      let date = Date(timeIntervalSince1970: value)
      return date.yearString
   }
}
class ShortDateAxisValueFormatter: IAxisValueFormatter {
   func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//      let date = Date(timeIntervalSince1970: value)
//      return "'\(date.shortYearString)"
      
      let yearInt = Int(value)
      let yearString = String(yearInt)
      
      let df = DateFormatter()
      df.dateFormat = "yyyy"
      let year = df.date(from: yearString)!
      df.dateFormat = "yy"
      let shortYearString = df.string(from: year)
      
      return "'\(shortYearString)"
   }
}
class PercentageAxisValueFormatter: IAxisValueFormatter {
   func stringForValue(_ value: Double, axis: AxisBase?) -> String {
      return value.roundedPercentage + "%"
   }
}
class PercentageValueFormatter: IValueFormatter {
   func stringForValue(_ value: Double,
                       entry: ChartDataEntry,
                       dataSetIndex: Int,
                       viewPortHandler: ViewPortHandler?) -> String {
      return value.roundedPercentage + "%"
   }
}
