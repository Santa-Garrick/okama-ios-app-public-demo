//
//  MutationPerformerProtocol.swift
//  Okama
//
//  Created by Pro13 on 20.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public protocol MutationPerformerProtocol {
   func createPortfolio(input: PortfolioInput,
                        completion: @escaping (Result<String, Error>) -> Void)
   
   func updatePortfolio(uuid: String,
                        input: PortfolioInput,
                        completion: @escaping (Result<Bool, Error>) -> Void)
   
   func deletePortfolio(id: String,
                        completion: @escaping (Result<Bool, Error>) -> Void)
}
