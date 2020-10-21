//
//  DateRangeManager.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Swinject

class DateRangeManager: DateRangeManagerProtocol {
   
   private var dateRangeFetcher: AvailableDatesFetching!
   weak var delegate: DateRangeManagerDelegate?
   
   required init(with service: AvailableDatesFetching) {
      dateRangeFetcher = service
   }
   
   private var ranges: [Asset: DateInterval] = [:]
   private var errors: [Error] = []
   
   private var fetching: Set<Asset> = [] {
      didSet {
         
         if fetching.isEmpty {
            delegate!.dateRangeDidUpdate(result: currentFetchingResult)
         } else {
            delegate!.startUpdating()
         }
         
      }
   }
      
   private var currentFetchingResult: Result<DateInterval, Error> {
      if errors.isEmpty,
         let range = ranges.maxPossibleInterval {
         return .success(range)
      }
      
      if !errors.isEmpty {
         return .failure(NetworkError.emptyResult)
         
      } else {
         return .failure(DateRangeError.noIntersection)
      }
   }
   
   func add(asset: Asset) {
      if ranges.keys.contains(asset) { // already fetched
         return
      }
      
      if fetching.contains(asset)  { // already fetching
         return
      }
      
      fetching.insert(asset)
      
      dateRangeFetcher.getDateRange(for: asset.identifier) { [weak self] (result) in
         
         guard let self = self else { return }
      
         // checking if fetched result is not removed yet
         guard self.fetching.contains(asset) else {
            return
         }
         
         switch result {
            
         case .success(let range):
            self.ranges[asset] = range
         case .failure(let error):
            self.errors.append(error)
         }
         self.fetching.remove(asset)
      }
      
   }
   
   func remove(asset: Asset) {
      ranges.removeValue(forKey: asset)
      fetching.remove(asset)
   }

}

