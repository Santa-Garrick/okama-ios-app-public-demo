//
//  InflationFetcher.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class InflationFetcher: InflationFetching {
   
   private let apollo = ApolloManager.shared
   
   func makeInflationQuery(for currency: Currency,
                           completion: @escaping (Result<Inflation, Error>) -> Void) {
      
      let query = InflationQuery(currency: currency)
      apollo.fetch(query: query) { [weak self] result in
         switch result {
            
         case .success(let data):
            guard let inflation = self?.makeInflation(fromQueryData: data) else {
               completion(.failure(NetworkError.emptyResult))
               return
            }
            
            completion(.success(inflation))
         case .failure(let error):
            print(error)
         }
      }
   }
   
   private func makeInflation(fromQueryData data: InflationQuery.Data) -> Inflation? {
      guard
         let currency = data.inflation?.currency,
         let monthsInflation = makeMonthsInflation(fromQueryData: data),
         let yoyInflation = makeYOYInflation(fromQueryData: data),
         let values = makeValuesInflation(fromQueryData: data)
         else { return nil }
      
      let inflation = Inflation(currency: currency,
                                monthsInflations: monthsInflation,
                                yoyInflations: yoyInflation,
                                values: values)
      
      return inflation
   }
   
   
   private func makeMonthsInflation(fromQueryData data: InflationQuery.Data) -> [TimeSeriesValue]? {
      
      guard
         let monthsInflationData = data.inflation?.months_12SlidingWindow
         else { return nil }
      
      let monthsInflations = monthsInflationData.compactMap({ $0?.combined })
         .flatMap({ $0 })
         .compactMap { $0 }
         .compactMap {
            TimeSeriesValue(period: Date(fromOkama: $0.period),
                            value: $0.value)
      }
      
      return monthsInflations
      
   }
   
   
   private func makeYOYInflation(fromQueryData data: InflationQuery.Data) -> [TimeSeriesValue]? {
      guard
         let yoyInflationData = data.inflation?.yearOnYear
         else { return nil }
      
      let yoyInflations = (yoyInflationData.combined ?? [])
         .compactMap({ $0 })
         .compactMap {
            TimeSeriesValue(period: Date(fromOkama: $0.period),
                            value: $0.value)
      }
      
      return yoyInflations
   }
   
   
   private func makeValuesInflation(fromQueryData data: InflationQuery.Data) -> [ValuesByYear]? {
      guard
         let valuesByYearData = data.inflation?.valuesByYear
         else { return nil }
      
      let values = valuesByYearData.compactMap({ $0 })
         .compactMap({ (yearValues) -> ValuesByYear? in
            
            guard let year = yearValues.year else { return nil }
            
            let combined = yearValues.values?.combined?.compactMap({ $0 }) ?? []
            
            let values = combined.compactMap {
               TimeSeriesValue(period: Date(fromOkama: $0.period),
                               value: $0.value)
            }
            guard let cumulative = (yearValues.cumulative?.values ?? []).last! else { return nil }
            
            return ValuesByYear(year: year,
                                values: values,
                                cumulative: cumulative)
         })
      
      
      
      return values
   }
   
   
   
   
}
