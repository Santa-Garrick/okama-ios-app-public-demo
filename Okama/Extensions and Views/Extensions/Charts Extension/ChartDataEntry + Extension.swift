//
//  ChartDataEntry + Extension.swift
//  Okama
//
//  Created by Pro13 on 09.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension ChartDataEntry {
   convenience init(from timeSeriesValue: TimeSeriesValue) {
      let x = timeSeriesValue.period.timeIntervalSince1970
      let y = timeSeriesValue.value
      self.init(x: x, y: y)
   }
}
