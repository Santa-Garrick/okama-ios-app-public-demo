//
//  ActivitiesTableModel.swift
//  Okama
//
//  Created by Pro13 on 04.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol ActivitiesTableModel {
   
   var numberOfColumns: Int { get }
   
   var numberOfRows: Int { get }
   
   var names: [String] { get }
   
   func title(forRow row: Int) -> String
   
   func value(forRow row: Int, andColumn column: Int) -> String
   
}

extension PortfolioAnalysis: ActivitiesTableModel {
   var names: [String] {
      
      var result = [NSLocalizedString("portfolioTableTitle", comment: "")]
      result.append(contentsOf: assetsActivities.map { $0.name })
      return result
   }
   
   var numberOfColumns: Int {
      assetsActivities.count + 1
   }
   
   var numberOfRows: Int {
      10 + (portfolioActivities.cagrs?.count ?? 0)
   }
   
   private var cagrsAmount: Int {
      portfolioActivities.cagrs?.count ?? 0
   }
   
   func title(forRow row: Int) -> String {
      if row == 0 { return "" }
      return self.portfolioActivities.titles![row - 1]
   }
   
   func value(forRow row: Int,
              andColumn column: Int) -> String {
      
      if row == 0 {
         if column == 0 {
            return NSLocalizedString("portfolioTableTitle", comment: "")
         } else {
            return assetsActivities[column - 1].name
         }
      }
      
      let activities = (column == 0) ? portfolioActivities : assetsActivities[column - 1].activities
      
      return activities.values![row - 1]
   }
   
}



extension Activities {
   var titles: [String]? {
      var titles = [
         K.Analysis.Activities.periodLength,
         K.Analysis.Activities.accountBalance,
         K.Analysis.Activities.cumulativeReturn,
         K.Analysis.Activities.ytdReturn
      ]
      
      guard let cagrs = cagrs else { return nil }
      
      titles.append(cagrs.titles)
      
      titles.append(contentsOf: [
         K.Analysis.Activities.standartDeviation,
         K.Analysis.Activities.cumulativeInflation,
         K.Analysis.Activities.averageInflation,
         K.Analysis.Activities.cumulativeRealReturn,
         K.Analysis.Activities.realCAGR
      ])
      return titles
   }
   var values: [String]? {
      var values = [
         yearPlusMonthStringFor(year: periodLengthYears,
                                month: periodLengthMonths),
         accountBalance.roundedString + (currency?.title ?? ""),
         cumulativeReturn.percentageString,
         ytdReturn.percentageString
      ]
      
      guard let cagrs = cagrs else { return nil }
      
      values.append(cagrs.values)
      
      values.append(contentsOf: [
         standardDeviation.percentageString,
         cumulativeInflation.percentageString,
         averageInflation.percentageString,
         realCumulativeReturn.percentageString,
         realCAGR.percentageString
      ])
      return values
   }
   private func yearPlusMonthStringFor(year: Int, month: Int) -> String {
      
      if year == 0 && month == 0 { return "" }
      
      if year == 0 {
         return K.Date.monthCount(for: month)
      }
      
      return K.Date.yearCount(for: year) + ", " + K.Date.monthCount(for: month)
   }
}

extension Array where Element == CAGR {
   var titles: [String] {
      if isEmpty { return [] }

      var titles = [self[0].titleFull]
      if count == 1 { return titles }
      for i in 1 ..< count {
         titles.append(self[i].titleShort)
      }
      return titles
   }
   var values: [String] {
      return self.map { $0.value.percentageString }
   }
}

extension CAGR {
   var titleFull: String {
      return K.Analysis.Activities.cagrFull(for: yearsAgo!)
   }
   var titleShort: String {
      return K.Analysis.Activities.cagrShort(for: yearsAgo!)
   }
}
