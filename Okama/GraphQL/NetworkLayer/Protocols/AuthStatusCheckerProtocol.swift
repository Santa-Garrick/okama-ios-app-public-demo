//
//  AuthStatusCheckerProtocol.swift
//  Okama
//
//  Created by Pro13 on 22.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public protocol AuthStatusCheckerProtocol: class {
   func checkIfAuthorized(completion: @escaping (Result<Bool,Error>) -> Void)
   func getUser(completion: @escaping (Result<OkamaUser, Error>) -> Void) 
}
