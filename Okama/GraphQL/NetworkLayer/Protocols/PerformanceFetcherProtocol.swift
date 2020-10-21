//
//  PerformanceFetcherProtocol.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public protocol PerformanceFetcherProtocol {
   typealias PerformanceCompletion = (Result<Portfolio.BasicAnalysis, Error>) -> Void
   
   func makePerformanceQuery(weighedAssets: [WeighedAsset],
                             conditions: Conditions,
                             completion: @escaping PerformanceCompletion)
   
}
