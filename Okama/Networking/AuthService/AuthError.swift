//
//  AuthError.swift
//  Okama
//
//  Created by Pro13 on 28.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public enum AuthError: Error {
   case notFilled
   case invalidEmail
   case passwordNotMatched
   case unknownError
   case networkError
	case webFormError
	case wrongCredentials // wrong email or password or not confirmed
}

extension AuthError: LocalizedError {
   public var errorDescription: String? {
		switch self {
		case .notFilled:
			return NSLocalizedString("notFilled",
											 comment: "")
		case .invalidEmail:
			return NSLocalizedString("invalidEmail",
											 comment: "")
		case .passwordNotMatched:
			return NSLocalizedString("passwords not matched",
											 comment: "")
		case .unknownError:
			return NSLocalizedString("unknownError",
											 comment: "")
		case .networkError:
			return NSLocalizedString("networkError",
											 comment: "")
		case .webFormError:
			return NSLocalizedString("webFormError",
											 comment: "")
		case .wrongCredentials:
			return NSLocalizedString("wrongCredentials",
											 comment: "")
		
		}
	}
}
