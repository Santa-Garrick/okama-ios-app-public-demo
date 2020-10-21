//
//  DateRangeFetcherProtocol.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public protocol AvailableDatesFetching {
   func getDateRange(for id: String,
                     completion: @escaping (Result<DateInterval, Error>) -> Void)
}
