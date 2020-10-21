//
//  ConstructorPresenting.swift
//  Okama
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


protocol ConstructorPresenting: class {
	
	var portfolio: Portfolio { get set }
	var availableDates: DateInterval? { get }
	
	init(portfolio: Portfolio?,
		  analyzer: AnalysisFetching,
		  dateRangeFetcher: AvailableDatesFetching,
		  mutationService: Mutating)
	
	// views
   var assetsView: AssetsDisplaying? { get set }
   var conditionsView: ConditionsDisplaying? { get set }
	var actionsView: ActionsDisplaying? { get set }
	
	// methods
   func updateAssets()
   func updateConditions()
	func updateActions()
	
	
	func addAsset(_ asset: Asset)
	func getWeight(forAssetAtIndex index: Int) -> Double 
	func setWeight(_ weight: Double, forAssetAtIndex index: Int)
   func remove(assetAtindex index: Int)
	
	func setDate(_ date: Date)
   func setAmount(_ amount: Double)
	func setCurrency(_ currency: Currency)
	
   func analyze()
	
	func saveTapped()
	func updateTapped()
	func deleteTapped()
	
	var initialAmount: Double { get }
	var currency: Currency { get }
	
}
