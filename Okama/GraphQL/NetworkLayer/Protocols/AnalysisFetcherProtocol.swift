//
//  AnalysisFetcherProtocol.swift
//  Okama
//
//  Created by Pro13 on 19.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public protocol AnalysisFetcherProtocol {
   func makePortfolioQuery(weighedAssets: [WeighedAsset],
                           conditions: Conditions,
                           completion: @escaping (Result<PortfolioAnalysis, Error>) -> Void)
}
