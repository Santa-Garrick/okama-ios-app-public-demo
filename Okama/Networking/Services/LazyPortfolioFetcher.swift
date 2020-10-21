//
//  LazyPortfolioFetcher.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class LazyPortfolioFetcher: PortfolioListFetching {
   
   private var dataFetcher: PerformanceFetching! = PerformanceFetcher()
   
   private let queriesGroup = DispatchGroup()
   private let queue = DispatchQueue(label: "Okama-PortfoliosFetcher",
                                     qos: .utility)
   
   func fetchPortfolioList(completion: @escaping (Result<[Portfolio], Error>) -> Void) {
      
      var inputs: [PortfolioInput] = []
      // 1
      // Richard Ferri's 2 assets Portfolio
      _ = {
         let assets = [
            WeighedAsset(asset: Asset(identifier: "us/BND",
                                      title: "Vanguard Total Bond Market Index Fund ETF Shares",
                                      exchange: "NASDAQ"),
                         weight: 0.6),
            WeighedAsset(asset: Asset(identifier: "us/VT",
                                      title: "Vanguard Total World Stock Index Fund ETF Shares",
                                      exchange: "NYSE ARCA"),
                         weight: 0.4)
         ]
         
         let input = PortfolioInput(name: "Richard Ferri's Portfolio (2 assets)",
                                    assets: assets,
                                    conditions: Conditions(startDate: Date(fromOkama: "2008-07"),
                                                           currency: .usd,
                                                           initialAmount: 100))
         inputs.append(input)
      }()
      // 2
      // Richard Ferri's 3 assets Portfolio
      _ = {
         let assets = [
            WeighedAsset(asset: Asset(identifier: "us/BND",
                                      title: "Vanguard Total Bond Market Index Fund ETF Shares",
                                      exchange: "NASDAQ"),
                         weight: 0.4),
            WeighedAsset(asset: Asset(identifier: "us/VTI",
                                      title: "Vanguard Total Stock Market Index Fund ETF Shares",
                                      exchange: "NYSE ARCA"),
                         weight: 0.4),
            WeighedAsset(asset: Asset(identifier: "us/VXUS",
                                      title: "Vanguard Total International Stock Index Fund ETF Shares",
                                      exchange: "NASDAQ"),
                         weight: 0.2)
         ]
         
         
         let input = PortfolioInput(name: "Richard Ferri's Portfolio (3 assets)",
                                    assets: assets,
                                    conditions: Conditions(startDate: Date(fromOkama: "2011-02"),
                                                           currency: .usd,
                                                           initialAmount: 100))
         
         inputs.append(input)
      }()
      // 3
      // Richard Ferri's 4 assets Portfolio
      _ = {
         let assets = [WeighedAsset(asset: Asset(identifier: "us/BND", title: "Vanguard Total Bond Market Index Fund ETF Shares", exchange: "NASDAQ"), weight: 0.2), WeighedAsset(asset: Asset(identifier: "us/VNQ", title: "Vanguard Real Estate Index Fund ETF Shares", exchange: "NYSE ARCA"), weight: 0.4), WeighedAsset(asset: Asset(identifier: "us/VT", title: "Vanguard Total World Stock Index Fund ETF Shares", exchange: "NYSE ARCA"), weight: 0.32), WeighedAsset(asset: Asset(identifier: "us/VXUS", title: "Vanguard Total International Stock Index Fund ETF Shares", exchange: "NASDAQ"), weight: 0.08)]
         
         let input = PortfolioInput(name: "Richard Ferri's Portfolio (4 assets)",
                                    assets: assets,
                                    conditions: Conditions(startDate: Date(fromOkama: "2011-02"),
                                                           currency: .usd,
                                                           initialAmount: 100))
         
         inputs.append(input)
         
      }()
      
      // 4
      // Sergei Spirin's Portfolio (3 assets) Portfolio
      _ = {
         let assets = [WeighedAsset(asset: Asset(identifier: "mut_ru/0890-94127385", title: "Открытие - Индекс МосБиржи", exchange: "MUT"), weight: 0.33), WeighedAsset(asset: Asset(identifier: "mut_ru/0165-70287767", title: "Открытие - Облигации", exchange: "MUT"), weight: 0.33), WeighedAsset(asset: Asset(identifier: "us/GLD", title: "SPDR Gold Shares", exchange: "NYSE ARCA"), weight: 0.34)]
         
         let input = PortfolioInput(name:"Sergei Spirin's Portfolio (3 assets)",
                                    assets: assets,
                                    conditions: Conditions(startDate: Date(fromOkama: "2007-09"),
                                                           currency: .rub,
                                                           initialAmount: 100))
         inputs.append(input)
         
      }()
      
      // 5
      // RostSber's Portfolio: Russia / USA (6 assets) Portfolio (3 assets) Portfolio
      _ = {
         let assets = [WeighedAsset(asset: Asset(identifier: "mut_ru/0890-94127385", title: "Открытие - Индекс МосБиржи", exchange: "MUT"), weight: 0.166), WeighedAsset(asset: Asset(identifier: "mut_ru/0165-70287767", title: "Открытие - Облигации", exchange: "MUT"), weight: 0.166), WeighedAsset(asset: Asset(identifier: "us/BND", title: "Vanguard Total Bond Market Index Fund ETF Shares", exchange: "NASDAQ"), weight: 0.166), WeighedAsset(asset: Asset(identifier: "us/GLD", title: "SPDR Gold Shares", exchange: "NYSE ARCA"), weight: 0.166), WeighedAsset(asset: Asset(identifier: "us/SPY", title: "SPDR S&P 500 ETF Trust", exchange: "NYSE ARCA"), weight: 0.166), WeighedAsset(asset: Asset(identifier: "us/VNQ", title: "Vanguard Real Estate Index Fund ETF Shares", exchange: "NYSE ARCA"), weight: 0.17)]
         
         
         
         let input = PortfolioInput(name: "RostSber's Portfolio: Russia / USA (6 assets)",
                                    assets: assets,
                                    conditions: Conditions(startDate: Date(fromOkama: "2007-09"),
                                                           currency: .rub,
                                                           initialAmount: 100))
         inputs.append(input)
      }()
      
      var portfolios: [Portfolio] = []
      var errors: [Error] = []
      for input in inputs {
         guard errors.isEmpty else { break }
         
         queriesGroup.enter()
         fetchPerformanceFor(input: input) { [weak self] (result) in
            switch result {
               
            case .success(let performance):
               portfolios.append(Portfolio(input: input,
                                           basicAnalysis: performance))
            case .failure(let error):
               errors.append(error)
            }
            self?.queriesGroup.leave()
         }
      }
      
      queriesGroup.notify(queue: .main) {
         if errors.isEmpty {
            completion(.success(portfolios))
         } else {
            completion(.failure(errors.first!))
         }
         
      }
      
   }
   
   private func fetchPerformanceFor(input: PortfolioInput,
                                    completion: @escaping (Result<Portfolio.BasicAnalysis, Error>) -> Void) {
      
      dataFetcher.makePerformanceQuery(weighedAssets: input.assets,
                                       conditions: input.conditions) { (result) in
                                          switch result {
                                          case .success(let performance):
                                             completion(.success(performance))
                                          case .failure(let error):
                                             completion(.failure(error))
                                          }
      }
   }
}
