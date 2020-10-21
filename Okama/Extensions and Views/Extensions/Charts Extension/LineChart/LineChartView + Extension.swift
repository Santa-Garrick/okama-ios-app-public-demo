//
//  LineChartView + Extension.swift
//  Okama
//
//  Created by Pro13 on 04.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension LineChartView {
   
   func configureAppearance(backgroundColor: UIColor,
                            legendEnabled: Bool = false) {
      self.backgroundColor = backgroundColor
      doubleTapToZoomEnabled = false
      pinchZoomEnabled = false

      noDataText = ""
      legend.enabled = false
      
      leftAxis.enabled = true
      leftAxis.drawLabelsEnabled = false
      
      rightAxis.labelFont = .systemFont(ofSize: 8, weight: .light)
      rightAxis.setLabelCount(6, force: false)
      rightAxis.labelTextColor = .secondaryText
      rightAxis.axisLineColor = .white
      rightAxis.labelPosition = .insideChart
      rightAxis.labelAlignment = .right
      rightAxis.yOffset = -4
      rightAxis.labelXOffset = 2
      
      xAxis.labelPosition = .bottom
      xAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
      xAxis.setLabelCount(6, force: false)
      xAxis.labelTextColor = .secondaryText
      xAxis.axisLineColor = .white
      
      xAxis.valueFormatter = DateAxisValueFormatter()
      rightAxis.valueFormatter = PercentageAxisValueFormatter()
      
      
      
      
      if legendEnabled {
         legend.enabled = true
         legend.form = .circle
         legend.verticalAlignment = .top
      }
   }
}
