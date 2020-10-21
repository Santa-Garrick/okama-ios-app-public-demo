//
//  Dictionary + Extension.swift
//  Okama
//
//  Created by Pro13 on 05.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

extension Dictionary {
   func percentEncoded() -> Data? {
      return map { key, value in
         let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
         let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
         return escapedKey + "=" + escapedValue
      }
      .joined(separator: "&")
      .data(using: .utf8)
   }
}


extension Dictionary where Value == DateInterval {
   var maxPossibleInterval: DateInterval? {
      guard let minDate = values.map({ $0.start}).max() else { return nil }
      guard let maxDate = values.map({ $0.end}).min() else { return nil }
      return DateInterval(start: minDate, end: maxDate)
   }
}

