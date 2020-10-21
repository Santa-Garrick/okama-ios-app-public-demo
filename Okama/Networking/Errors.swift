//
//  NetworkError.swift
//  Okama
//
//  Created by Pro13 on 24.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public enum NetworkError: Error {
   case userNotAuthorized
   case emptyResult
	case serverError
	case portfoliosAmountExceeded
}

extension NetworkError: LocalizedError {
	public var errorDescription: String? {
		switch self {

		case .userNotAuthorized:
			return NSLocalizedString("You need to be authorized",
											 comment: "")
		case .emptyResult:
			return NSLocalizedString("Empty response from server",
											 comment: "")
		case .serverError:
			return NSLocalizedString("Server is not responding",
											 comment: "")
		case .portfoliosAmountExceeded:
			return NSLocalizedString("You have reached maximum amount (5) of save portfolios",
											 comment: "")
		}
   }
}
