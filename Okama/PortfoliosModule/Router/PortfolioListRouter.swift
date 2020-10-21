//
//  PortfolioListRouter.swift
//  Okama
//
//  Created by Pro13 on 21.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject

class PortfolioListRouter: PortfolioListRouting {
   
   weak var viewController: UIViewController!
   
   let container: Container
   
   required init(with container: Container) {
      self.container = container
   }
   
   func routeToPortfolio(atIndex index: Int) {
      container.register(Portfolio.self) { r in
         let portfolio = r
            .resolve(PortfolioListDataStore.self)!.portfolios[index]
         print(portfolio)
         return portfolio
         
      }
      let vc = ConstructorConfigurator(withContainer: container).makeModule()
      let navVC = viewController?.navigationController
      navVC?.pushViewController(vc,
                                animated: true)
   }
   
}
