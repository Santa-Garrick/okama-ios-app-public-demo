//
//  InflationFetcherProtocol.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public protocol InflationFetcherProtocol {
   func makeInflationQuery(for currency: Currency,
                           completion: @escaping (Result<Inflation, Error>) -> Void)
}
