//
//  Constants.swift
//  Okama
//
//  Created by Pro13 on 27.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

enum K {
   
   enum SearchModule {
      static let addTitle = NSLocalizedString("searchAddTitle",
                                              comment: "searchAddTitle")
      static let addedTitle = NSLocalizedString("searchAddedTitle",
                                                comment: "searchAddedTitle")
      static let errorMessage = NSLocalizedString("errorMessage",
                                                  comment: "errorMessage")
      static let emptyResultMessage = NSLocalizedString("emptyResultMessage",
                                                        comment: "emptyResultMessage")
   }
   enum Title {
      static let constructor = NSLocalizedString("Constructor",
                                                 comment: "constructor title")
      static let myPortfolios = NSLocalizedString("My portfolios",
                                                  comment: "myPortfolios title")
      static let lazyPortfolios = NSLocalizedString("Lazy portfolios",
                                                    comment: "lazyPortfolios title")
      static let inflation = NSLocalizedString("Inflation",
                                               comment: "inflation title")
      static let glossary = NSLocalizedString("Glossary",
                                              comment: "glossary title")
      static let addNew = NSLocalizedString("Add new",
                                            comment: "addNew title")
      static let enterWeight = NSLocalizedString("Enter weight",
                                                 comment: "enterWeight title")
      static let enterAmount = NSLocalizedString("Enter amount",
                                                 comment: "enterAmount title")
      static let chooseDate = NSLocalizedString("Choose start date",
                                                comment: "chooseDate title")
      static let newPortfolio = NSLocalizedString("New portfolio",
                                                  comment: "newPortfolio title")
      
      
      
      
   }
   enum Message {
      static let addAtLeastOne = NSLocalizedString("Add at least one asset",
                                                   comment: "addAtLeastOne message")
      static let loadingAvailableDates = NSLocalizedString("Loading available dates",
                                                           comment: "loadingAvailableDates")
      static let loadingAnalysis = NSLocalizedString("Loading analysis",
                                                     comment: "loadingAnalysis")
   }
   enum Constructor {
      static let header = NSLocalizedString("Assets",
                                            comment: "header")
      static let addNew = NSLocalizedString("Add new asset",
                                            comment: "addNew")
      static let analyze = NSLocalizedString("Analyze",
                                             comment: "analyze")
      static let showAnalysis = NSLocalizedString("Show analysis",
                                                  comment: "showAnalysis")
      
   }
   enum Date {
      static let yearCount = NSLocalizedString("year count",
                                               comment: "year count")
      static func yearCount(for count: Int) -> String {
         return String.localizedStringWithFormat(yearCount, count)
      }
      static let monthCount = NSLocalizedString("month count",
                                                comment: "month count")
      static func monthCount(for count: Int) -> String {
         return String.localizedStringWithFormat(monthCount, count)
      }
   }
   enum Analysis {
      enum Segment {
         static let activities = NSLocalizedString("Activities",
                                                   comment: "activities")
         static let chart = NSLocalizedString("Chart",
                                              comment: "chart")
         static let annualReturns = NSLocalizedString("Annual Returns",
                                                      comment: "annualReturns")
         
      }
      enum Activities {
         
         static let periodLength = NSLocalizedString("periodLength",
                                                     comment: "periodLength")
         
         static let accountBalance = NSLocalizedString("accountBalance",
                                                       comment: "accountBalance")
         
         static let cumulativeReturn = NSLocalizedString("cumulativeReturn",
                                                         comment: "cumulativeReturn")
         
         static let ytdReturn = NSLocalizedString("ytdReturn",
                                                  comment: "ytdReturn")
         
         static let cagrFull = NSLocalizedString("CAGR for year",
                                                 comment: "cagr full")
         
         static func cagrFull(for count: Int) -> String {
            return cagrFull + " " + K.Date.yearCount(for: count)
         }
         static let cagrShort = NSLocalizedString("for year",
                                                  comment: "cagr short")
         
         static func cagrShort(for count: Int) -> String {
            return cagrShort + " " + K.Date.yearCount(for: count)
         }
         static let standartDeviation = NSLocalizedString("standartDeviation",
                                                          comment: "standartDeviation")
         static let cumulativeInflation = NSLocalizedString("cumulativeInflation",
                                                            comment: "cumulativeInflation")
         static let averageInflation = NSLocalizedString("averageInflation",
                                                         comment: "averageInflation")
         static let cumulativeRealReturn = NSLocalizedString("cumulativeRealReturn",
                                                             comment: "cumulativeRealReturn")
         static let realCAGR = NSLocalizedString("realCAGR",
                                                 comment: "realCAGR")
      }
   }
}

