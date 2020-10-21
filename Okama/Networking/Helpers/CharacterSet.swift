//
//  CharacterSet.swift
//  Okama
//
//  Created by Pro13 on 05.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

extension CharacterSet {
   static let urlQueryValueAllowed: CharacterSet = {
      let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
      let subDelimitersToEncode = "!$&'()*+,;="
      
      var allowed = CharacterSet.urlQueryAllowed
      allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
      return allowed
   }()
}
