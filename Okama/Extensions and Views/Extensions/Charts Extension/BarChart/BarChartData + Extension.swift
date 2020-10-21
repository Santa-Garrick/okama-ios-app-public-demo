//
//  BarChartData + Extension.swift
//  Okama
//
//  Created by Pro13 on 07.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension BarChartData {
   convenience init(dataSet: BarChartDataSet, barWidth: Double) {
      self.init(dataSet: dataSet)
      self.barWidth = barWidth
   }
}
