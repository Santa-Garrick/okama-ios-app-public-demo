//
//  ChartPresenter.swift
//  Okama
//
//  Created by Pro13 on 31.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import Charts


class PortfolioChartPresenter: PortfolioChartPresenterProtocol, ChartSettingsDelegate {
   
   
   var isLogarithmic: Bool = false
   
   var view: PortfolioChartViewProtocol
   
   private var dataSets = [SelectionItem<LineChartDataSet>]()
   private var selectedSets: [LineChartDataSet] {
      return dataSets
         .filter { $0.isSelected }
         .map { $0.item }
   }
   var labels: [SelectionItem<String>] {
      return dataSets.map { SelectionItem<String>(item: $0.item.label!,
                                                  isSelected: $0.isSelected)}
   }
   
   required init(view: PortfolioChartViewProtocol,
                 analysis: PortfolioAnalysis,
                 defaultSelected: [Int] = [0, 1]) {
      
      self.view = view
      var dataSets = createDataSets(from: analysis)
      _ = defaultSelected.map { dataSets[$0].isSelected = true }
      self.dataSets = dataSets
   }
   
   func setItem(atIndex index: Int, selected: Bool) {
      dataSets[index].isSelected = selected
      view.setDataSets(selectedSets)
   }
   
   func requestData() {
      view.setDataSets(selectedSets)
   }
   
   
}


extension PortfolioChartPresenter {
   private func createDataSets(from analysis: PortfolioAnalysis) -> [SelectionItem<LineChartDataSet>] {
      
      let portfolioEntries = cumulativeReturnsViewModel(forAnalysis: analysis)
      
      let inflationEntries = inflationsViewModel(for: analysis)
      
      let portfolioSet = LineChartDataSet(forEntries: portfolioEntries,
                                          withLabel: "Portfolio",
                                          color: ChartColors.portfolio.color,
                                          filledEnabled: false)
      let inflationSet = LineChartDataSet(forEntries: inflationEntries,
                                          withLabel: "Inflation",
                                          color: ChartColors.inflation.color,
                                          filledEnabled: true)
            
      var result = [
         SelectionItem<LineChartDataSet>(item: portfolioSet,
                                         isSelected: false),
         SelectionItem<LineChartDataSet>(item: inflationSet,
                                         isSelected: false)
      ]
      
      for (i, asset) in analysis.assetsActivities.enumerated() {
         let entries = cumulativeReturnsViewModel(forAssetAnalysis: asset)
         let label = asset.name
         let color = ChartColors.asset(index: i).color
         
         let set = LineChartDataSet(forEntries: entries,
                                    withLabel: label,
                                    color: color,
                                    filledEnabled: false)
         result.append(SelectionItem<LineChartDataSet>(item: set,
                                                       isSelected: false))
      }
      
      return result
   }
   private func cumulativeReturnsViewModel(forAnalysis analysis: PortfolioAnalysis) -> [ChartDataEntry] {
      return analysis.cumulativeReturns.map {
         ChartDataEntry(x: $0.period.timeIntervalSince1970,
                        y: $0.value)
      }
   }
   private func cumulativeReturnsViewModel(forAssetAnalysis analysis: AssetAnalysis) -> [ChartDataEntry] {
      return analysis.cumulativeReturns.map {
         ChartDataEntry(x: $0.period.timeIntervalSince1970,
                        y: $0.value)
      }
   }
   private func inflationsViewModel(for analysis: PortfolioAnalysis) -> [ChartDataEntry] {
      return analysis.inflations.map {
         ChartDataEntry(x: $0.period.timeIntervalSince1970,
                        y: $0.value)
      }
   }
}

