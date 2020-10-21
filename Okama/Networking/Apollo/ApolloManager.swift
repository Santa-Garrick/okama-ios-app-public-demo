//
//  ApolloManager.swift
//  Okama
//
//  Created by Pro13 on 04.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Apollo

class ApolloManager: HTTPNetworkTransportPreflightDelegate {
   
   static let shared = ApolloManager()
   private init() {
      configureClient()
   }
   
   private let urlString = "https://okama.io/api/graphql"
   
   private var apollo: ApolloClient!
      
   typealias Completion<Operation: GraphQLOperation> = (Result<Operation.Data, Error>) -> Void

   func configureClient() {

      let networkTransport = HTTPNetworkTransport(url: URL(string: urlString)!)
      networkTransport.delegate = self
      apollo = ApolloClient(networkTransport: networkTransport)
      
   }
   
   func fetch<Query: GraphQLQuery>(query: Query,
                                   completion: @escaping Completion<Query>) {
      apollo.fetch(query: query) { result in

         switch result {
         case .success(let graphQLResult):
            if let errors = graphQLResult.errors {
               Logger.shared.log(errors: errors)
            }
            if let data = graphQLResult.data {
               completion(.success(data))
            } else {
               completion(.failure(NetworkError.emptyResult))
            }
         case .failure(let error):
				print(error)
            completion(.failure(error))
         }
      }
   }
   
   func perform<Mutation: GraphQLMutation>(mutation: Mutation,
                                           completion: @escaping Completion<Mutation>) {
      apollo.perform(mutation: mutation) { (result) in

         switch result {
         case .success(let graphQLResult):
            if let errors = graphQLResult.errors {
               Logger.shared.log(errors: errors)
            }
            if let data = graphQLResult.data {
               completion(.success(data))
            } else {
               completion(.failure(NetworkError.emptyResult))
            }
         case .failure(let error):
				print(error)
				completion(.failure(NetworkError.serverError))
         }
      }
      
   }
   
   
   
   func networkTransport(_ networkTransport: HTTPNetworkTransport,
                         shouldSend request: URLRequest) -> Bool {
      true
   }
   
   func networkTransport(_ networkTransport: HTTPNetworkTransport,
                         willSend request: inout URLRequest) {
      
      // Get the existing headers, or create new ones if they're nil
      var headers = request.allHTTPHeaderFields ?? [String: String]()
      
      // Add any new headers you need
      let cookies = HTTPCookieStorage.shared.cookies ?? []
      let cookiesDict = HTTPCookie.requestHeaderFields(with: cookies)
      for (key, value) in cookiesDict {
         headers[key] = value
      }
            
      // Re-assign the updated headers to the request.
      request.allHTTPHeaderFields = headers
   }
   
}
