//
//  MonthsInflationVewController.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts


class MonthsInflationVewController: ViewControllerWithLoadingView, ChartViewDelegate {

   var dateLabelConstraint: NSLayoutConstraint!
   var dateLabelWidthConstraint: NSLayoutConstraint!
   
   var legendContainerView = UIView()
   var legendItemView = LegendItemView()
   
   var dateLabel = UILabel(text: "",
                           font: .systemFont(ofSize: 9, weight: .light),
                           textColor: .chartViewGoldHighlight,
                           numberOfLines: 1,
                           textAlignment: .left)
   
   var chartView = LineChartView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      
      configureChartView()
      setupLayout()

   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      dateLabelWidthConstraint.constant = dateLabel.intrinsicContentSize.width
      dateLabelWidthConstraint.isActive = true
   }
   
   private func setupLayout() {
      
      legendContainerView.backgroundColor = .secondaryBackground
      legendContainerView.layer.cornerRadius = 8
      view.addSubview(chartView)
      chartView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(legendContainerView)
      legendContainerView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(dateLabel)
      dateLabel.translatesAutoresizingMaskIntoConstraints = false
      
      legendContainerView.addSubview(legendItemView)
      legendItemView.translatesAutoresizingMaskIntoConstraints = false
      
      
      // date label
      dateLabel.bottomAnchor.constraint(equalTo: chartView.topAnchor, constant: 10).isActive = true
      let leftAndRightCons: [NSLayoutConstraint] = [
         dateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: chartView.leadingAnchor),
         dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: chartView.trailingAnchor)
      ]
      
      dateLabelWidthConstraint = dateLabel.widthAnchor.constraint(equalToConstant: dateLabel.width)
      
//      NSLayoutConstraint.activate(constraints: leftAndRightCons, withPriority: UILayoutPriority(1000))
      
      NSLayoutConstraint.activate(leftAndRightCons)
      
      dateLabelConstraint = dateLabel.centerXAnchor.constraint(equalTo: chartView.leadingAnchor)
      
      dateLabelConstraint.isActive = true
      dateLabelConstraint.priority = UILayoutPriority(999)
      
      
      let marginsGuide = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
         
         legendContainerView.topAnchor.constraint(equalTo: marginsGuide.topAnchor,
                                                  constant: 8),
         legendContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: 8),
         legendContainerView.trailingAnchor.constraint(equalTo: view.centerXAnchor,
                                                       constant: -8),
         legendContainerView.heightAnchor.constraint(equalToConstant: 26),
         
         
         //
         legendItemView.topAnchor.constraint(equalTo: legendContainerView.topAnchor,
                                             constant: 4),
         legendItemView.leadingAnchor.constraint(equalTo: legendContainerView.leadingAnchor,
                                                 constant: 4),
         
         
         legendItemView.trailingAnchor.constraint(equalTo: legendContainerView.trailingAnchor,
                                                  constant: -4),
         
         
         legendItemView.bottomAnchor.constraint(equalTo: legendContainerView.bottomAnchor,
                                                constant: -4),
         
         
         //
         chartView.topAnchor.constraint(equalTo: legendContainerView.bottomAnchor,
                                        constant: 4),
         chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: 4),
         chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -4),
         chartView.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor,
                                           constant: -4),

      ])
      
   }
   private func configureChartView() {
      chartView.configureAppearance(backgroundColor: .clear,
                                    legendEnabled: false)
      chartView.delegate = self
   }
   
   func chartValueSelected(_ chartView: ChartViewBase,
                           entry: ChartDataEntry,
                           highlight: Highlight) {

      let value = entry.y.percentageString
      let date = Date(timeIntervalSince1970: entry.x)
      let dataSet = chartView.data!.dataSets[0]
      
      legendItemView.configure(dataSetName: dataSet.label!,
                               value: value,
                               color: dataSet.colors.first!)
      
      self.dateLabel.text = date.uiStringYearFirst
      dateLabelConstraint.constant = highlight.xPx
   }
}


extension MonthsInflationVewController: CurrencyView {
   
   func showData(inflation: Inflation) {
      if let monthsInflations = inflation.monthsInflations {
         stopLoadingAnimation()
         let entries = monthsInflations.map { ChartDataEntry(from: $0) }
         let dataSet = LineChartDataSet(forEntries: entries, withLabel: "Inflation", color: .systemBlue, filledEnabled: false)
         chartView.data = LineChartData(dataSet: dataSet)
         chartView.animate(xAxisDuration: 0.1)
         
      }
   }
   
   func showLoader() {
      chartView.data = nil
      startLoadingAnimation(with: "Loading")
   }
}

