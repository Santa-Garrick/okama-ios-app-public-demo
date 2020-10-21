//
//  AuthStatusChecker.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class AuthStatusChecker: AuthStatusChecking {
   private let apollo = ApolloManager.shared
   
   func checkIfAuthorized(completion: @escaping (Result<Bool,Error>) -> Void) {
      let query = CurrentUserQuery()
      
      apollo.configureClient()
      apollo.fetch(query: query) { (result) in
         switch result {
         case .success(let data):
            if data.me?.email != nil {
               completion(.success(true))
            } else {
               completion(.success(false))
            }
            
         case .failure(let error):
            completion(.failure(error))
         }
      }
   }
   
   func getUser(completion: @escaping (Result<OkamaUser, Error>) -> Void) {
      let query = CurrentUserQuery()
      
      apollo.configureClient()
      apollo.fetch(query: query) { (result) in
         switch result {
         case .success(let user):
            if let username = user.me?.username, let email = user.me?.email {
               completion(.success(OkamaUser(email: email,
                                             username: username)))
            } else {
               completion(.failure(NetworkError.emptyResult))
            }
            
         case .failure(let error):
            completion(.failure(error))
         }
      }
   }
}
