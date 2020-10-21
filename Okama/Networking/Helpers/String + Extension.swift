//
//  String + Extension.swift
//  Okama
//
//  Created by Pro13 on 05.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

extension String {
   
   func ranges(of string: String,
               options: CompareOptions = .literal) -> [Range<Index>] {
      
      var result: [Range<Index>] = []
      var start = startIndex
      while let range = range(of: string,
                              options: options,
                              range: start..<endIndex) {
                                 result.append(range)
                                 start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
      }
      return result
   }
   
   func slices(from: String, to: String) -> [Substring] {
      let pattern = "(?<=" + from + ").*?(?=" + to + ")"
      return ranges(of: pattern, options: .regularExpression).map{ self[$0] }
   }
}
