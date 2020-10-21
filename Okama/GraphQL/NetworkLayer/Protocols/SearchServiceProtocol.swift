//
//  SearchServiceProtocol.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public protocol SearchServiceProtocol {
   func makeSearchQuery(with searchText: String,
                        completion: @escaping (Result<[Asset], Error>) -> Void)
}
