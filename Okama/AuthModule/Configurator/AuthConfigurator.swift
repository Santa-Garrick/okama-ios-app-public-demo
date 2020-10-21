//
//  AuthConfigurator.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Swinject

class AuthConfigurator: Configurator {
   private let container: Container
   
	required init(withContainer container: Container) {
      self.container = container
   }
   
   func makeModule() -> UIViewController {
		let vc = AuthViewController()
		vc.auth = container.resolve(AuthServiceProtocol.self)!
      return vc
   }
   
   
}
