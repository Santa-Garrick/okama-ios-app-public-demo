//
//  CombinedChartView + Extension.swift
//  Okama
//
//  Created by Pro13 on 16.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

extension CombinedChartView {
   func configureAppearance(backgroundColor: UIColor,
                            legendEnabled: Bool = false) {
      
      self.backgroundColor = backgroundColor
      //      xAxis.gridColor = .clear
      xAxis.gridLineWidth = 0.5
      
      rightAxis.spaceBottom = 0.02
      leftAxis.spaceBottom = 0.02
      
      rightAxis.labelFont = .systemFont(ofSize: 8, weight: .light)
      rightAxis.setLabelCount(10, force: false)
      rightAxis.labelTextColor = .secondaryText
      rightAxis.axisLineColor = .secondaryText
      rightAxis.labelPosition = .outsideChart
      rightAxis.labelAlignment = .right
      rightAxis.yOffset = -4
      rightAxis.labelXOffset = 2
      rightAxis.valueFormatter = PercentageAxisValueFormatter()
      
      leftAxis.labelFont = .systemFont(ofSize: 8, weight: .light)
      leftAxis.setLabelCount(10, force: false)
      leftAxis.labelTextColor = .white
      leftAxis.axisLineColor = .white
      leftAxis.labelPosition = .outsideChart
      leftAxis.labelAlignment = .right
      leftAxis.yOffset = -4
      leftAxis.labelXOffset = 2
      leftAxis.valueFormatter = PercentageAxisValueFormatter()
      
      xAxis.labelPosition = .bottom
      xAxis.setLabelCount(10, force: false)
      xAxis.valueFormatter = ShortDateAxisValueFormatter()
      
      
      legend.enabled = legendEnabled
      
   }
}
