//
//  DateRangeFetcher.swift
//  Okama
//
//  Created by Pro13 on 21.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class DateRangeFetcher: AvailableDatesFetching {
   
   private let apollo = ApolloManager.shared

   func getDateRange(for id: String,
                     completion: @escaping (Result<DateInterval, Error>) -> Void) {
      
      let query = DateRangeQuery(assetName: id)
      
      print(query)
      apollo.fetch(query: query) { result in
         
         switch result {
         case .success(let data):
            guard
               let dateStringMin = data.portfolioAsset?.returnValues?.period?.min,
               let dateStringMax = data.portfolioAsset?.returnValues?.period?.max,
               let dateMin = Date(fromOkama: dateStringMin),
               let dateMax = Date(fromOkama: dateStringMax)
               else {
                  completion(.failure(NetworkError.emptyResult))
                  return
                  
            }
            
            completion(.success(DateInterval(start: dateMin,
                                             end: dateMax)))
         case .failure(let error):
            completion(.failure(error))
         }
         
      }
   }
   
   
}

