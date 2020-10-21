//
//  AssetsSearcher.swift
//  Okama
//
//  Created by Pro13 on 21.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Apollo

class SearchService: Searching {
   private let apollo = ApolloManager.shared
   
   func makeSearchQuery(with searchText: String, completion: @escaping (Result<[Asset], Error>) -> Void) {
      
      
      apollo.fetch(query: AssetsByQueryQuery(query: searchText)) { [weak self] result in
         
         switch result {
         case .success(let data):
            guard
               let assetsByQuery = data.assetsByQuery,
               let optionalAssets = assetsByQuery.first,
               let assets = optionalAssets,
               let optionalSymbols = assets.symbols
               else {
                  completion(.failure(NetworkError.emptyResult))
                  return
            }
           
            let symbols = optionalSymbols.compactMap { $0 }
            let searchItems = symbols.compactMap { self?.asset(from: $0) }
            
            completion(.success(searchItems))
            
         case .failure(let error):
            completion(.failure(error))
         }
      }
      
      
      
   }
   
   private func asset(from symbol: AssetsByQueryQuery.Data.AssetsByQuery.Symbol) -> Asset? {
      
      guard
         let title = symbol.title,
         let identifier = symbol.identifier?.full,
         let exchange = symbol.exchange
         else { return nil }
      
      return Asset(identifier: identifier,
                   title: title,
                   exchange: exchange)
   }
   
   
}
