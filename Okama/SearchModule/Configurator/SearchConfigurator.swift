//
//  SearchAssembly.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject

class SearchConfigurator: Configurator {
   private let container: Container
   
   required init(withContainer container: Container) {
      self.container = container
      
      container.register(SearchPresenterProtocol.self) { r in
         let delegate = r.resolve(SearchDelegate.self)
         let service = r.resolve(Searching.self)
         
         let presenter = SearchPresenter()
         presenter.networking = service
         presenter.delegate = delegate
         return presenter
      }.initCompleted { (r, presenter) in
         presenter.view = r.resolve(SearchDisplaying.self)!
      }
      
      container.register(SearchDisplaying.self) { r in
         let vc = SearchViewController()
         vc.presenter = r.resolve(SearchPresenterProtocol.self)!
         return vc
      }
      
      container.register(SearchViewController.self) { r in
         return r.resolve(SearchDisplaying.self)! as! SearchViewController
      }
      
   }
   func makeModule() -> UIViewController {
      let vc = container.resolve(SearchViewController.self)!
      return UINavigationController(rootViewController: vc)
      
   }

}
