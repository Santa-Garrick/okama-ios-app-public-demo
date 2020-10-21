//
//  AnalysisFetcher.swift
//  Okama
//
//  Created by Pro13 on 20.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Apollo

enum NetworkError: Error {
   case userIsNil
   case emptyResult
   case portfoliosAmountExceeded
}



class AnalysisFetcher: AnalysisFetcherProtocol {
   
   private let apollo = ApolloManager.shared
   
   func makePortfolioQuery(weighedAssets: [WeighedAsset],
                           conditions: Conditions,
                           completion: @escaping (Result<PortfolioAnalysis, Error>) -> Void) {
      let inputs = weighedAssets.map {
         PortfolioAssetInput(name: $0.asset.identifier, weight: $0.weight)
      }
      
      let startDate = Calendar.current.date(byAdding: .month,
                                            value: -1,
                                            to: conditions.startDate!)
      let startPeriod = startDate!.okamaApiString
      
      let query = PortfolioAnalysisQuery(assetInputs: inputs,
                                         startPeriod: startPeriod,
                                         currency: conditions.currency,
                                         initialAmount: conditions.initialAmount)
      
      apollo.fetch(query: query) { [weak self] result in
         
         switch result {
         case .success(let data):
            
            guard let portfolio = data.portfolio else { return }
            guard let assets = portfolio.assets else { return }
            
            guard let self = self else { return }
            
            let portfolioActivities = self.analyzedActivities(for: portfolio)
            let analysedAssets = assets.compactMap({$0}).map { asset in
               
               return self.assetAnalysis(for: asset)
            }
            
            let returns = self.cumulativeReturns(for: portfolio)
            let inflations = self.inflations(for: portfolio)
            
            let annuals = self.annualReturns(for: portfolio)
            
            let analysis = PortfolioAnalysis(portfolioActivities: portfolioActivities,
                                             cumulativeReturns: returns,
                                             inflations: inflations,
                                             annualReturns: annuals,
                                             assetsActivities: analysedAssets)
            completion(.success(analysis))
            
         case .failure(let error):
            completion(.failure(error))
         }
      }
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   private func annualReturns(for portfolio: PortfolioAnalysisQuery.Data.Portfolio) -> [TimeSeriesValue] {
      let combinedValues = (portfolio.annualReturns?.combined ?? []).compactMap { $0 }
      
      var annuals = [TimeSeriesValue]()
      
      for combined in combinedValues {
         let date = Date(fromOkama: combined.period) ?? Date()
         let value = combined.value ?? 0
         let newAnnual = TimeSeriesValue(period: date, value: value)
         annuals.append(newAnnual)
      }
      
      return annuals
   }
   
   private func assetAnalysis(for asset: PortfolioAnalysisQuery.Data.Portfolio.Asset) -> AssetAnalysis {
      let weight = asset.weight ?? 0
      let asset = asset.asset
      
      let currency = Currency.init(rawValue: asset?.currency?.selected ?? "")
      
      let years = asset?.periodDuration?.years ?? 0
      let months = asset?.periodDuration?.months ?? 0
      
      let balance = asset?.balance?.values?.compactMap ({ $0 }).last ?? 0
      
      let cumReturn = asset?.cumulativeReturn?.values?.compactMap({$0}).last ?? 0
      
      let ytdReturn = asset?.ytdReturn?.values?.compactMap({$0}).last ?? 0
      
      let cagrs = (asset?.cagrs?.compactMap({$0}) ?? []).map {
         CAGR(yearsAgo: $0.yearsAgo, value: $0.value)
      }
      
      // standart deviation == yearly risk !!!!
      let standartDeviation = asset?.yearlyRisk ?? 0
      
      let cumulativeInflation = asset?.cumInflation?.values?.compactMap({$0}).last ?? 0
      
      // average inflation == g mean inflation !!!
      let averageInflation = asset?.gMeanInflation?.values?.compactMap({$0}).last ?? 0
      
      // real cumulative return
      let realCumulativeReturn = asset?.realCumulativeReturn?.values?.compactMap({$0}).last ?? 0
      
      // Real CAGR ???
      let realCAGR = (asset?.realCagr?.compactMap({$0}) ?? []).last?.value
      
      
      let activities = AnalyzedActivities(currency: currency,
                                          periodLengthYears: years,
                                          periodLengthMonths: months,
                                          accountBalance: balance,
                                          cumulativeReturn: cumReturn,
                                          ytdReturn: ytdReturn,
                                          cagrs: cagrs,
                                          standardDeviation: standartDeviation,
                                          cumulativeInflation: cumulativeInflation,
                                          averageInflation: averageInflation,
                                          realCumulativeReturn: realCumulativeReturn,
                                          realCAGR: realCAGR)
      
      let id = asset?.identifier?.full ?? ""
      let name = asset?.shortName ?? ""
      
      let cumReturns = cumulativeReturns(forAsset: asset!)
      
      
      return AssetAnalysis(id: id,
                           name: name,
                           weight: weight,
                           activities: activities,
                           cumulativeReturns: cumReturns)
   }
   
   
   
   private func cumulativeReturns(for portfolio: PortfolioAnalysisQuery.Data.Portfolio) -> [TimeSeriesValue] {
      
      let combined = (portfolio.combinedCumulativeReturns?.combined ?? []).compactMap({ $0 })
      
      return combined.map {
         let date = Date(fromOkama: $0.period) ?? Date()
         let value = $0.value ?? 0
         return TimeSeriesValue(period: date, value: value + 1)
      }
   }
   
   private func cumulativeReturns(forAsset asset: PortfolioAnalysisQuery.Data.Portfolio.Asset.Asset) -> [TimeSeriesValue] {
      
      let combined = (asset.combinedCumulativeReturns?.combined ?? []).compactMap({ $0 })
      
      return combined.map {
         let date = Date(fromOkama: $0.period) ?? Date()
         let value = $0.value ?? 0
         return TimeSeriesValue(period: date, value: value + 1)
      }
   }
   
   
   private func inflations(for portfolio: PortfolioAnalysisQuery.Data.Portfolio) -> [TimeSeriesValue] {
      
      
      let combinedValues = (portfolio.combinedInflations?.combined ?? []).compactMap({ $0 })
      
      var result = [TimeSeriesValue]()
      let first = TimeSeriesValue(period: Date(fromOkama: combinedValues[0].period) ?? Date(),
                                  value: (combinedValues[0].value ?? 0) + 1)
      result.append(first)
      
      for i in 1 ..< combinedValues.count {
         let new = TimeSeriesValue(period: Date(fromOkama: combinedValues[i].period) ?? Date(),
                                   value: ((combinedValues[i].value ?? 0) + 1)*result[i - 1].value)
         result.append(new)
      }
      
      return result
      
      
   }
   
   private func analyzedActivities(for portfolio: PortfolioAnalysisQuery.Data.Portfolio) -> AnalyzedActivities {
      
      let currency = portfolio.currency
      
      let years = portfolio.periodDuration?.years ?? 0
      let months = portfolio.periodDuration?.months ?? 0
      
      let balance = portfolio.balance?.returnValues?.values?.compactMap({ $0 }).last
      
      let cumReturn = portfolio.cumulativeReturn?.values?.compactMap({$0}).last
      
      let ytdReturn = portfolio.ytdReturn?.values?.compactMap({$0}).last
      
      let cagrs = (portfolio.cagrs?.compactMap({$0}) ?? []).map {
         CAGR(yearsAgo: $0.yearsAgo, value: $0.value)
      }
      
      // standart deviation == yearly risk !!!!
      let standartDeviation = portfolio.yearlyRisk ?? 0
      
      let cumulativeInflation = portfolio.cumInflation?.values?.compactMap({$0}).last ?? 0
      
      // average inflation == g mean inflation !!!
      let averageInflation = portfolio.gMeanInflation?.values?.compactMap({$0}).last ?? 0
      
      // real cumulative return
      let realCumulativeReturn = portfolio.realCumulativeReturn?.values?.compactMap({$0}).last ?? 0
      
      // Real CAGR ???
      let realCAGR = (portfolio.realCagr?.compactMap({$0}) ?? []).last?.value
      
      let activities = AnalyzedActivities(currency: currency,
                                          periodLengthYears: years,
                                          periodLengthMonths: months,
                                          accountBalance: balance,
                                          cumulativeReturn: cumReturn,
                                          ytdReturn: ytdReturn,
                                          cagrs: cagrs,
                                          standardDeviation: standartDeviation,
                                          cumulativeInflation: cumulativeInflation,
                                          averageInflation: averageInflation,
                                          realCumulativeReturn: realCumulativeReturn,
                                          realCAGR: realCAGR)
      
      return activities
   }
   
   
}
