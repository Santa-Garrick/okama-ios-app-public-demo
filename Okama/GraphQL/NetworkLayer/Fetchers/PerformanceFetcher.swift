//
//  PerformanceFetcher.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class PerformanceFetcher: PerformanceFetcherProtocol {
   
   private let apollo = ApolloManager.shared
   
   func makePerformanceQuery(weighedAssets: [WeighedAsset],
                             conditions: Conditions,
                             completion: @escaping (Result<Portfolio.BasicAnalysis, Error>) -> Void) {
      let inputs = weighedAssets.map {
         PortfolioAssetInput(name: $0.asset.identifier, weight: $0.weight)
      }
      
      let startDate = Calendar.current.date(byAdding: .month,
                                            value: -1,
                                            to: conditions.startDate!)
      
      let startPeriod = startDate!.okamaApiString
      
      let query = PortfolioPerformanceQuery(assetInputs: inputs,
                                            startPeriod: startPeriod,
                                            currency: conditions.currency)
      
      apollo.fetch(query: query) { result in
         switch result {
         case .success(let data):
            
            guard let portfolio = data.portfolio else {
               completion(.failure(NetworkError.emptyResult))
               return
            }
            
            let ytdReturn = portfolio.ytdReturn?.values?.compactMap({$0}).last ?? 0
            let standartDeviation = portfolio.yearlyRisk ?? 0
            
            let performance = Portfolio.BasicAnalysis(ytdReturn: ytdReturn,
                                                      standartDeviation: standartDeviation)
            completion(.success(performance))
            
         case .failure(let error):
            print(error)
            completion(.failure(error))
         }
      }
   }
}
