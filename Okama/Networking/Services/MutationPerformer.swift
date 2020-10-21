//
//  MutationPerformer.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class MutationPerformer: Mutating {

   private let apollo = ApolloManager.shared
   
   func createPortfolio(input: PortfolioInput,
                        completion: @escaping (Result<String, NetworkError>) -> Void) {
      
      
      
      let assets = input.assets.map { PortfolioAssetWeightedInput(weight: $0.weight, name: $0.asset.identifier) }
      let currency = input.conditions.currency
      let initialAmount = input.conditions.initialAmount
      let startDateString = input.conditions.startDate!.okamaApiString
      let period = PortfolioPeriod(start: startDateString)
      
      let mutation = CreatePortfolioMutation(assets: assets,
                                             currency: currency,
                                             initialAmount: initialAmount,
                                             period: period)
      apollo.perform(mutation: mutation) { (result) in
         switch result {
            
         case .success(let data):
            if let uuid = data.createPortfolio?.uuid {
               completion(.success(uuid))
            } else if
               let errors = data.createPortfolio?.errors?.compactMap({ $0 }),
               let _ = errors
                  .filter({ $0 == "Portfolios amount exceeded 5" })
                  .first {
               completion(.failure(NetworkError.portfoliosAmountExceeded))
            }
            
         case .failure(let error):
            print(error.localizedDescription)
            completion(.failure(NetworkError.serverError))
         }
      }
   }
   func updatePortfolio(uuid: String,
                        input: PortfolioInput,
                        completion: @escaping (Result<Void, NetworkError>) -> Void) {
      
      let assets = input.assets.map { PortfolioAssetWeightedInput(weight: $0.weight, name: $0.asset.identifier) }
      let currency = input.conditions.currency
      let initialAmount = input.conditions.initialAmount
      let startDateString = input.conditions.startDate!.okamaApiString
      let period = PortfolioPeriod(start: startDateString)
      
      let mutation = UpdatePortfolioMutation(assets: assets,
                                             currency: currency,
                                             initialAmount: initialAmount,
                                             period: period,
                                             uuid: uuid)
      
      apollo.perform(mutation: mutation) { (result) in
         switch result {
            
         case .success(let data):
            if let success = data.updatePortfolio?.ok, success == true {
               completion(.success(()))
            } else {
               completion(.failure(NetworkError.serverError))
            }
            
         case .failure(let error):
            completion(.failure(NetworkError.serverError))
         }
      }
   }
   
   func deletePortfolio(id: String,
                        completion: @escaping (Result<Void, NetworkError>) -> Void) {
      
      let mutation = DeletePortfolioMutation(id: id)
      
      apollo.perform(mutation: mutation) { (result) in
         switch result {
            
         case .success(let data):
            if let success = data.deletePortfolio?.ok, success == true {
               completion(.success(()))
            } else {
               completion(.failure(NetworkError.serverError))
            }
            
         case .failure(let error):
				print(error)
            completion(.failure(NetworkError.serverError))
         }
      }
      
   }
}
