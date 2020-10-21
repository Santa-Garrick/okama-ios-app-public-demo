//
//  PortfolioAnalysis.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public struct PortfolioAnalysis {
   let portfolioActivities: AnalyzedActivities
   let cumulativeReturns: [TimeSeriesValue]
   let inflations: [TimeSeriesValue]
   let annualReturns: [TimeSeriesValue]
   
   let assetsActivities: [AssetAnalysis]
}

public struct AssetAnalysis {
   let id: String
   let name: String
   let weight: Double
   let activities: AnalyzedActivities
   let cumulativeReturns: [TimeSeriesValue]
}

public extension PortfolioAnalysis {
   var weighedAssets: [WeighedAsset] {
      return assetsActivities.map { $0.weighedAsset }
   }
}

public extension AssetAnalysis {
   var weighedAsset: WeighedAsset {
      return WeighedAsset(asset: Asset(identifier: id,
                                       title: name,
                                       exchange: nil),
                          weight: weight)
   }
}

public struct AnalyzedActivities {
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
