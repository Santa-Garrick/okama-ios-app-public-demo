//
//  Okama.swift
//  OkamaGraphQL
//
//  Created by Pro13 on 23.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public class Okama {
   
   static let shared = Okama()
   private init() {}
   
   internal let inflationFetcher = InflationFetcher()
   internal let analysisFetcher = AnalysisFetcher()
   internal let authStatusChecker = AuthStatusChecker()
   internal let searchService = SearchService()
   internal let dateRangeFetcher = DateRangeFetcher()
   internal let mutationPerformer = MutationPerformer()
   internal let portfolioListFetcher = UserPortfolioFetcher()
   internal let performanceFetcher = PerformanceFetcher()

}

extension Okama: PerformanceFetcherProtocol {
   public func makePerformanceQuery(weighedAssets: [WeighedAsset], conditions: Conditions, completion: @escaping PerformanceCompletion) {
      
      performanceFetcher.makePerformanceQuery(weighedAssets: weighedAssets, conditions: conditions, completion: completion)
      
   }
}

extension Okama: PortfolioListFetcherProtocol {
   public func fetchPortfolioList(completion: @escaping (Result<[Portfolio], Error>) -> Void) {
      portfolioListFetcher.fetchPortfolioList(completion: completion)
   }
}

extension Okama: MutationPerformerProtocol {
   public func createPortfolio(input: PortfolioInput, completion: @escaping (Result<String, Error>) -> Void) {
      mutationPerformer.createPortfolio(input: input, completion: completion)
   }
   
   public func updatePortfolio(uuid: String, input: PortfolioInput, completion: @escaping (Result<Bool, Error>) -> Void) {
      mutationPerformer.updatePortfolio(uuid: uuid, input: input, completion: completion)
   }
   
   public func deletePortfolio(id: String, completion: @escaping (Result<Bool, Error>) -> Void) {
      mutationPerformer.deletePortfolio(id: id, completion: completion)
   }
}

extension Okama: DateRangeFetcherProtocol {
   public func getDateRange(for id: String, completion: @escaping (Result<DateInterval, Error>) -> Void) {
      dateRangeFetcher.getDateRange(for: id, completion: completion)
   }
}



extension Okama: SearchServiceProtocol {
   public func makeSearchQuery(with searchText: String, completion: @escaping (Result<[Asset], Error>) -> Void) {
      searchService.makeSearchQuery(with: searchText, completion: completion)
   }
   
   
}


extension Okama: AnalysisFetcherProtocol {
   public func makePortfolioQuery(weighedAssets: [WeighedAsset], conditions: Conditions, completion: @escaping (Result<PortfolioAnalysis, Error>) -> Void) {
      analysisFetcher.makePortfolioQuery(weighedAssets: weighedAssets, conditions: conditions, completion: completion)
   }
}

extension Okama: InflationFetcherProtocol {
   public func makeInflationQuery(for currency: Currency, completion: @escaping (Result<Inflation, Error>) -> Void) {
      inflationFetcher.makeInflationQuery(for: currency, completion: completion)
   }
}

extension Okama: AuthStatusCheckerProtocol {
   public func checkIfAuthorized(completion: @escaping (Result<Bool, Error>) -> Void) {
      authStatusChecker.checkIfAuthorized(completion: completion)
   }
   
   public func getUser(completion: @escaping (Result<OkamaUser, Error>) -> Void) {
      authStatusChecker.getUser(completion: completion)
   }
}
