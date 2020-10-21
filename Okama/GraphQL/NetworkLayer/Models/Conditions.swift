//
//  Conditions.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public struct Conditions: Codable {
   var startDate: Date?
   var currency: Currency
   var initialAmount: Double
}

extension Currency: Codable {
   
}

