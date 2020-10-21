//
//  PortfolioListFetcherProtocol.swift
//  Okama
//
//  Created by Pro13 on 31.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public protocol PortfolioListFetching {
   func fetchPortfolioList(completion: @escaping (Result<[Portfolio], Error>) -> Void)
}

