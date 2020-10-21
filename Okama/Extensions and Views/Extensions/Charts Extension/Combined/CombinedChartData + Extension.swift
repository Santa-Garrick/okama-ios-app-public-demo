//
//  CombinedChartData + Extension.swift
//  Okama
//
//  Created by Pro13 on 16.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension CombinedChartData {
   convenience init(timeSeriesValues: [TimeSeriesValue],
        label: String) {
      self.init()
      
      let lineEntries: [ChartDataEntry] = timeSeriesValues
         .map ({ timeSeriesValue in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            let yearString = dateFormatter.string(from: timeSeriesValue.period)
            
            let x = Double(yearString)!
            
            let y = timeSeriesValue.value
            return ChartDataEntry(x: x, y: y)
         })
      
      let barEntries: [BarChartDataEntry] = timeSeriesValues
         .map ({ timeSeriesValue in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            let yearString = dateFormatter.string(from: timeSeriesValue.period)
            
            let x = Double(yearString)!
            
            let y = timeSeriesValue.value
            return BarChartDataEntry(x: x, y: y)
         })
      
      let lineDataSet = LineChartDataSet(forEntries: lineEntries, withLabel: "", color: .clear, filledEnabled: false)
      
      let lineData = LineChartData(dataSet: lineDataSet)
      let barDataSet = BarChartDataSet(forEntries: barEntries,
                                       withLabel: label)
      let barData = BarChartData(dataSet: barDataSet)
      
      self.lineData = lineData
      self.barData = barData
         
   }
}
