//
//  ConstructorConfigurator.swift
//  Okama
//
//  Created by Pro13 on 21.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//
import UIKit
import Swinject


class ConstructorConfigurator: Configurator {
   private let container: Container
   
   required init(withContainer container: Container) {
      self.container = container
   }
   func makeModule() -> UIViewController {
		
		let vc = ConstructorViewController()
		
		let portfolio = container.resolve(Portfolio.self)
		let analyzer = container.resolve(AnalysisFetching.self)!
		let dates = container.resolve(AvailableDatesFetching.self)!
		let mutations = container.resolve(Mutating.self)!
		
		let presenter = ConstructorPresenter(portfolio: portfolio,
														 analyzer: analyzer,
														 dateRangeFetcher: dates,
														 mutationService: mutations)
		let assetsVC = AssetsViewController()
		let conditionsVC = ConditionsViewController()
		
		presenter.actionsView = vc
		presenter.assetsView = assetsVC
		presenter.conditionsView = conditionsVC
		
		assetsVC.presenter = presenter
		conditionsVC.presenter = presenter
		
		let assetsRouter = AssetsRouter(with: container)
		assetsVC.router = assetsRouter
		assetsRouter.viewController = assetsVC
		
		let conditionsRouter = ConditionsRouter(with: container)
		conditionsVC.router = conditionsRouter
		conditionsRouter.viewController = conditionsVC
		
		vc.assetsVC = assetsVC
		vc.conditionsVC = conditionsVC
		
		vc.presenter = presenter
		
		let authVC = AuthConfigurator(withContainer: container).makeModule()
		vc.authVC = authVC
      return vc
   }

}
