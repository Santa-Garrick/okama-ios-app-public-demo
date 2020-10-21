//
//  ChartViewProtocol.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Charts

protocol PortfolioChartViewProtocol: class {
   func setDataSets(_ dataSets: [LineChartDataSet])
}

