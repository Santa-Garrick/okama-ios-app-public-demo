//
//  AnnualReturnsViewController.swift
//  Okama
//
//  Created by Pro13 on 12.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//


import UIKit
import Charts

class AnnualReturnsViewController: UIViewController, ChartViewDelegate {
   
   var annualReturns: [TimeSeriesValue]!
   
   var dateLabelConstraint: NSLayoutConstraint!
   var dateLabelWidthConstraint: NSLayoutConstraint!
   
   var legendContainerView = UIView()
   var legendItemView = LegendItemView()
   
   var dateLabel = UILabel(text: "",
                           font: .systemFont(ofSize: 9, weight: .light),
                           textColor: .chartViewGoldHighlight,
                           numberOfLines: 1,
                           textAlignment: .left)
   
   
   var chartView = CombinedChartView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      
      configureChartView()
      setupLayout()
      

      let combData = CombinedChartData(timeSeriesValues: annualReturns, label: "Portfolio")
         
      chartView.data = combData
      chartView.animate(xAxisDuration: 0.1)
      
      
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
      let dataSet = (chartView.data as! CombinedChartData).barData.dataSets[0]
      
      let index = dataSet.entryIndex(entry: entry)
      legendItemView.configure(dataSetName: dataSet.label!,
                               value: value,
                               color: dataSet.colors[index])
      
      self.dateLabel.text = "\(Int(entry.x))"
      dateLabelConstraint.constant = highlight.xPx
   }
}

