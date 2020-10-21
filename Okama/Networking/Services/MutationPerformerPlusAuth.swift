//
//  MutationPerformerPlusAuth.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class MutationPerformerPlusAuth: Mutating {
   
   private let auth = AuthStatusChecker()
   private let performer = MutationPerformer()
   
   func createPortfolio(input: PortfolioInput,
                        completion: @escaping (Result<String, NetworkError>) -> Void) {
      auth.checkIfAuthorized { [weak self] (result) in
         switch result {
            
         case .success(let isAuthorized):
            if isAuthorized {
               self?.performer.createPortfolio(input: input,
                                               completion: completion)
            } else {
               completion(.failure(NetworkError.userNotAuthorized))
            }
         case .failure(_):
            completion(.failure(NetworkError.serverError))
         }
      }
   }
   
   func updatePortfolio(uuid: String,
                        input: PortfolioInput,
                        completion: @escaping (Result<Void, NetworkError>) -> Void) {
      auth.checkIfAuthorized { [weak self] (result) in
         switch result {
            
         case .success(let isAuthorized):
            if isAuthorized {
               self?.performer.updatePortfolio(uuid: uuid,
                                               input: input,
                                               completion: completion)
            } else {
               completion(.failure(NetworkError.userNotAuthorized))
            }
         case .failure(_):
            completion(.failure(NetworkError.serverError))
         }
      }
   }
   
   func deletePortfolio(id: String,
                        completion: @escaping (Result<Void, NetworkError>) -> Void) {
      auth.checkIfAuthorized { [weak self] (result) in
         switch result {
            
         case .success(let isAuthorized):
            if isAuthorized {
               self?.performer.deletePortfolio(id: id,
                                               completion: completion)
            } else {
               completion(.failure(NetworkError.userNotAuthorized))
            }
         case .failure(_):
            completion(.failure(NetworkError.serverError))
         }
      }
   }
   
   
}
