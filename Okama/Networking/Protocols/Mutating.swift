//
//  MutationPerformerProtocol.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public typealias OkamaID = String

public protocol Mutating {
   func createPortfolio(input: PortfolioInput,
                        completion: @escaping (Result<OkamaID, NetworkError>) -> Void)
   func updatePortfolio(uuid: String,
                        input: PortfolioInput,
                        completion: @escaping (Result<Void, NetworkError>) -> Void)
   func deletePortfolio(id: String,
                        completion: @escaping (Result<Void, NetworkError>) -> Void)
}
