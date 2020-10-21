//
//  AnalysisConfigurator.swift
//  Okama
//
//  Created by Pro13 on 04.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject

class AnalysisConfigurator: Configurator {
   private let container: Container
   required init(withContainer container: Container) {
      self.container = container
   }
   
   func makeModule() -> UIViewController {
      
      let vc = AnalysisViewController()
      vc.activitiesVC = makeActivitiesVC()
      vc.chartVC = makeChartVC()
      vc.annualReturnsVC = makeAnnualReturnsVC()
		
      return vc
   }
   
   private func makeActivitiesVC() -> UIViewController {
      let vc = ActivitiesViewController()
      vc.activities = container.resolve(PortfolioAnalysis.self)!
      return vc
   }
   
   private func makeChartVC() -> UIViewController {
      let config = PortfolioChartConfigurator(withContainer: container)
      return config.makeModule()
   }
   
   private func makeAnnualReturnsVC() -> UIViewController {
      let vc = AnnualReturnsViewController()
      let annualReturns = container
         .resolve(PortfolioAnalysis.self)!
         .annualReturns
      vc.annualReturns = annualReturns
      return vc
   }
   
   
}

