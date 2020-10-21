//
//  Configurator.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject

class PortfolioChartConfigurator: Configurator {
   private let container: Container
   required init(withContainer container: Container) {
      self.container = container
   }
   
   func makeModule() -> UIViewController {
      let vc = PortfolioChartViewController()
      let analysis = container.resolve(PortfolioAnalysis.self)!
      vc.presenter = PortfolioChartPresenter(view: vc,
                                             analysis: analysis)
      return vc 
   }
   
   
   
   
}
