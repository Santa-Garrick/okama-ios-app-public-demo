//
//  UserPortfolioListConfigurator.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Swinject

class PortfolioListConfigurator: Configurator {
   private let container: Container
   
   required init(withContainer container: Container) {
      self.container = container
   }
   
   func makeModule() -> UIViewController {
      let vc = PortfolioListViewController()
      vc.auth = container.resolve(AuthServiceProtocol.self)!
      vc.dataFetcher = container.resolve(PortfolioListFetching.self)
      let router = PortfolioListRouter(with: container)
      router.viewController = vc
      vc.router = router
      container.register(PortfolioListDataStore.self) { _ in
         return vc
      }
      
      return vc
   }
}
