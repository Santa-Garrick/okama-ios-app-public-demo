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
   var conditions: Conditions
   
   init(name: String? = nil,
        assets: [WeighedAsset],
        conditions: Conditions) {
      self.name = name
      self.assets = assets
      self.conditions = conditions
   }
   init() {
      self.name = nil
      self.assets = []
      self.conditions = Conditions()
   }
	
	static var empty: PortfolioInput {
		return PortfolioInput()
	}
	
	mutating func normalizeWeights() {
		// only if all the weights equal zero
		if assets.map({ $0.weight }).filter({ $0 != 0}).isEmpty {
			// make all the weights equal to each other
			let targetWeight = 1.0 / Double(assets.count)
			for i in assets.indices {
				assets[i].weight = targetWeight
			}
		}
	}
   
}

