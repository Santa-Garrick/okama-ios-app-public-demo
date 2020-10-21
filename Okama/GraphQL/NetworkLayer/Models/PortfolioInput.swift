//
//  PortfolioInput.swift
//  Okama
//
//  Created by Pro13 on 21.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public struct PortfolioInput: Codable {
   let name: String?

   var assets: [WeighedAsset]
   let conditions: Conditions
   
   init(name: String? = nil,
        assets: [WeighedAsset],
        conditions: Conditions) {
      self.name = name
      self.assets = assets
      self.conditions = conditions
   }
   
}

public struct Portfolio: Codable {

   let uuid: String?

   let input: PortfolioInput
   var basicAnalysis: BasicAnalysis?
   
   init(uuid: String? = nil,
        input: PortfolioInput,
        basicAnalysis: BasicAnalysis? = nil) {
      self.uuid = uuid
      self.input = input
      self.basicAnalysis = basicAnalysis
   }
   
   public struct BasicAnalysis: Codable {
      let ytdReturn: Double
      let standartDeviation: Double
   }
}



