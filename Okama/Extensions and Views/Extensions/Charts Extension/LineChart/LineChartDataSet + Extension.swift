//
//  LineChartDataSet + Extension.swift
//  Okama
//
//  Created by Pro13 on 13.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension LineChartDataSet {
   convenience init(forEntries entries: [ChartDataEntry],
                    withLabel label: String,
                    color: UIColor,
                    filledEnabled: Bool) {
      self.init(entries: entries, label: label)
      
      drawCirclesEnabled = false
      mode = .cubicBezier
      
      lineWidth = 2
      setColor(color)
      highlightColor = .chartViewGoldHighlight
      drawValuesEnabled = false
      highlightEnabled = true
      //
      valueFormatter = PercentageValueFormatter()
      //
      if filledEnabled {
         fill = Fill(color: color)
         fillAlpha = 0.4
         drawFilledEnabled = true
      }
      
      drawHorizontalHighlightIndicatorEnabled = false
      
   }
}
