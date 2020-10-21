//
//  InflationsConfigurator.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Swinject

class InflationsConfigurator: Configurator {
   private let container: Container
   required init(withContainer container: Container) {
      self.container = container
   }
   
   func makeModule() -> UIViewController {
      
      let vc = InflationContainerViewController()
      let service = container.resolve(InflationFetching.self)!
      let presenter = InflationPresenter(with: vc,
                                         service: service)
      vc.presenter = presenter
      vc.monthsVC = MonthsInflationVewController()
      vc.yoyVC = YOYInflationViewController()
      vc.valuesVC = InflationValuesViewController()
      return vc
   }
   
   
}
