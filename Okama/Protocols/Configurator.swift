//
//  Configurator.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Swinject

protocol Configurator {
   init(withContainer container: Container)
   func makeModule() -> UIViewController
}
