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
   case serverError
}

extension AuthError: LocalizedError {
   public var errorDescription: String? {
      switch self {
      case .notFilled:
         return NSLocalizedString("Заполните все поля", comment: "")
      case .invalidEmail:
         return NSLocalizedString("Неверный формат почты", comment: "")
      case .passwordNotMatched:
         return NSLocalizedString("Пароли не совпадают", comment: "")
      case .unknownError:
         return NSLocalizedString("Неизвестная ошибка", comment: "")
      case .serverError:
         return NSLocalizedString("Ошибка сервера", comment: "")
      }
   }
}
