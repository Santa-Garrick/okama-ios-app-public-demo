//
//  Portfolio.swift
//  Okama
//
//  Created by Pro13 on 24.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

public struct Portfolio {

   var uuid: String?

	var input: PortfolioInput {
		didSet {
			analysis = nil
		}
	}
   var basicAnalysis: BasicAnalysis?
	var analysis: PortfolioAnalysis?
	
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
	
	static var empty: Portfolio {
		return Portfolio(input: PortfolioInput.empty)
	}
}

extension Portfolio {
	var assets: [WeighedAsset] {
		get {
			input.assets
		}
	}
	var startDate: Date? {
		get {
			input.conditions.startDate
		}
		set {
			input.conditions.startDate = newValue
		}
	}
	var initialAmount: Double {
		get {
			input.conditions.initialAmount
		}
		set {
			input.conditions.initialAmount = newValue
		}
	}
	var currency: Currency {
		get {
			input.conditions.currency
		}
		set {
			input.conditions.currency = newValue
		}
	}
	
}



