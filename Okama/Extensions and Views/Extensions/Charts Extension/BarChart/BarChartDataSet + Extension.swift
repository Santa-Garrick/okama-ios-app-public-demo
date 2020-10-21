//
//  BarChartDataSet.swift
//  Okama
//
//  Created by Pro13 on 16.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts


extension BarChartDataSet {
   convenience init(forEntries entries: [BarChartDataEntry],
                    withLabel label: String) {
      self.init(entries: entries, label: label)
      drawValuesEnabled = false
//      highlightEnabled = true
//      highlightColor = .chartViewGoldHighlight
      let colors = entries.map {
         $0.y >= 0 ? ChartColors.positiveColor : ChartColors.negativeColor
      }
      setColors(colors, alpha: 0.8)
   }
}
