//
//  ServicesContainer.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Swinject

extension Container {
   static var okamaServices: Container {
      let c = Container()
      c.register(AvailableDatesFetching.self) { _ in
         DateRangeFetcher()
      }
      c.register(PerformanceFetching.self) { _ in
         PerformanceFetcher()
      }
      c.register(InflationFetching.self) { _ in
         InflationFetcher()
      }
      c.register(AnalysisFetching.self) { _ in
         AnalysisFetcher()
      }
      c.register(AuthStatusChecking.self) { _ in
         AuthStatusChecker()
      }
      c.register(Searching.self) { _ in
         SearchService()
      }
      c.register(Mutating.self) { _ in
         MutationPerformerPlusAuth()
      }
      c.register(AuthServiceProtocol.self) { _ in
         OkamaFlaskAuthService.shared
      }
		c.register(AuthStatusPublisher.self) { _ in
			OkamaFlaskAuthService.shared
		}
      return c
   }
}
