//
//  ChartPresenterProtocol.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol PortfolioChartPresenterProtocol: class {
   var view: PortfolioChartViewProtocol { get }
   var labels: [SelectionItem<String>] { get }
   
   init(view: PortfolioChartViewProtocol,
        analysis: PortfolioAnalysis,
        defaultSelected: [Int])
   
   func requestData()
}
