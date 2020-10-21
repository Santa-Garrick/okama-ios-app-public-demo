//
//  Logger.swift
//  Okama
//
//  Created by Pro13 on 29.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

class Logger {
   static let shared = Logger()
   
   func log(errors: [Error]) {
      for error in errors {
         print("error:", error.localizedDescription)
      }
   }
}
