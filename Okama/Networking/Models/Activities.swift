//
//  Activities.swift
//  Okama
//
//  Created by Pro13 on 04.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public struct Activities {
   let currency: Currency?
   let periodLengthYears: Int
   let periodLengthMonths: Int
   let accountBalance: Double?
   let cumulativeReturn: Double?
   let ytdReturn: Double?
   let cagrs: [CAGR]?
   let standardDeviation: Double?
   let cumulativeInflation: Double?
   let averageInflation: Double?
   let realCumulativeReturn: Double?
   let realCAGR: Double?
}

public struct CAGR {
   let yearsAgo: Int?
   let value: Double?
}

