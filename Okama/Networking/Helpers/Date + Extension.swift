//
//  Date + Extension.swift
//  Okama
//
//  Created by Pro13 on 28.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public extension Date {
   
   init?(fromOkama string: String?) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM"
      dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
      guard
         let string = string,
         let date = dateFormatter.date(from: string) else {
         return nil
      }
      self = date
   }
   
   var okamaApiString: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM"
      return dateFormatter.string(from: self)
   }
   
   var uiString: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "LLLL yyyy"
      return dateFormatter.string(from: self)
   }
   var uiStringYearFirst: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy, LLLL"
      return dateFormatter.string(from: self)
   }
   
   var yearString: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "YYYY"
      return dateFormatter.string(from: self)
   }
   var shortYearString: String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "YY"
      return dateFormatter.string(from: self)
   }
   var monthNumber: Int {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM"
      return Int(dateFormatter.string(from: self))!
   }
   
   
}


