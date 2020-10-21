//
//  UserPortfolioFetcher.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class UserPortfolioFetcher: PortfolioListFetching {
   
   private let apollo = ApolloManager.shared
   
   func fetchPortfolioList(completion: @escaping (Result<[Portfolio], Error>) -> Void) {
      
      getUserPorfolios { (result) in
         switch result {
            
         case .success(let portfolios):
            completion(.success(portfolios))
         case .failure(let error):
				
				print(error)
				
            completion(.failure(error))
         }
      }
      
   }
   
   private func getUserPorfolios(completion: @escaping (Result<[Portfolio], Error>) -> Void) {
      
      let query = UserPortfolioListQuery()
      
      apollo.configureClient()
      apollo.fetch(query: query) { (result) in
         switch result {
            
         case .success(let data):
            let portfolios = (data.me?.portfolios?
               .compactMap({ $0 }) ?? [])
               .compactMap { self.getPortfolio(from: $0) }
            completion(.success(portfolios))
         case .failure(let error):
				print(error)
				completion(.failure(NetworkError.serverError))
         }
      }
   }
   
   private func getPortfolio(from apiPortfolio: UserPortfolioListQuery.Data.Me.Portfolio) -> Portfolio? {
      
      let uuid = apiPortfolio.uuid
      
      let startDate = Date(fromOkama: apiPortfolio.composition?.periodDuration?.startPeriod)
      guard
         let currency = apiPortfolio.composition?.currency
         else { return nil }
      let initialAmount = apiPortfolio.initialAmount ?? 100
      
      let conditions = Conditions(startDate: startDate,
                                  currency: currency,
                                  initialAmount: initialAmount)
      
      let weighedAssets = (apiPortfolio.composition?.assets ?? [])
         .compactMap({ getWeighedAsset(from: $0) })
      
      
      let performance = getPerformance(from: apiPortfolio)
      
      return Portfolio(uuid: uuid,
                       input: PortfolioInput(assets: weighedAssets,
                                             conditions: conditions),
                       basicAnalysis: performance)
   }
   
   
   private func getWeighedAsset(from apiAsset: UserPortfolioListQuery.Data.Me.Portfolio.Composition.Asset?) -> WeighedAsset? {
      
      guard
         let id = apiAsset?.asset?.identifier?.full,
         let title = apiAsset?.asset?.shortName,
         let weight = apiAsset?.weight
         else { return nil }
      let asset = Asset(identifier: id,
                        title: title,
                        exchange: nil)
      
      return WeighedAsset(asset: asset, weight: weight)
      
   }
   
   private func getPerformance(from apiPortfolio: UserPortfolioListQuery.Data.Me.Portfolio) -> Portfolio.BasicAnalysis? {
      
      guard
         let ytdReturn = (apiPortfolio.performance?.ytdReturn?.values ?? [])
            .compactMap({ $0 }).last,
         let standartDeviation = apiPortfolio.performance?.yearlyRisk
         
         else { return nil }
      
      return Portfolio.BasicAnalysis(ytdReturn: ytdReturn,
                                     standartDeviation: standartDeviation)
      
   }
   
   
   
   
   
}
