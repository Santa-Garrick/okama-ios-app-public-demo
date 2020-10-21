//
//  PortfolioChartViewController.swift
//  Okama
//
//  Created by Pro13 on 12.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

class PortfolioChartViewController: UIViewController, PortfolioChartViewProtocol, ChartViewDelegate {
   
   func setDataSets(_ dataSets: [LineChartDataSet]) {
      self.dataSets = dataSets
   }
   
   var presenter: PortfolioChartPresenterProtocol!
         
   var dataSets: [LineChartDataSet] = [] {
      didSet {
         if dataSets.isEmpty {
            chartView.data = nil
         } else {
            chartView.data = LineChartData(dataSets: dataSets)
         }
      }
   }
   
   var legendItems: [LegendItem] = [] {
      didSet {
         DispatchQueue.main.async {
            self.legendCollectionView.reloadData()
         }
         
      }
   }
   
   var dateLabelConstraint: NSLayoutConstraint!
   var dateLabelWidthConstraint: NSLayoutConstraint!
   
   var legendContainerView = UIView()
   
   var dateLabel = UILabel(text: "",
                           font: .systemFont(ofSize: 9, weight: .light),
                           textColor: .chartViewGoldHighlight,
                           numberOfLines: 1,
                           textAlignment: .left)
   
   var legendCollectionView: UICollectionView!
   
   var addButton = UIButton(image: UIImage(systemName: "plus")!,
                            backgroundColor: .secondaryBackground,
                            cornerRadius: 8)
   
   var chartView = LineChartView()
   var isLogarithmic = false

   override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   @objc private func addTapped() {
      
      let labels = presenter.labels
      
      let vc = ChartSettingsViewController(labels: labels,
                                           isLogarithmic: isLogarithmic,
                                           delegate: presenter as! ChartSettingsDelegate)
      
      let navigationController = UINavigationController(rootViewController: vc)
      present(navigationController,
              animated: true,
              completion: nil)
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      DispatchQueue.main.async {
         self.legendCollectionView.reloadData()
         self.chartView.animate(xAxisDuration: 0.2)
      }
   }
   override func viewDidLoad() {
      super.viewDidLoad()
            
      view.backgroundColor = .mainBackground
      
      addButton.addTarget(self,
                          action: #selector(addTapped),
                          for: .touchUpInside)
      
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.itemSize = CGSize(width: 116, height: 14)
      layout.minimumLineSpacing = 1
      layout.minimumInteritemSpacing = 1
      layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      
      legendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      legendCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      legendCollectionView.backgroundColor = .clear
      legendCollectionView.delegate = self
      legendCollectionView.dataSource = self
      legendCollectionView.register(LegendItemCell.self,
                                    forCellWithReuseIdentifier: LegendItemCell.reuseID)
      chartView.delegate = self
      chartView.configureAppearance(backgroundColor: .clear)
      
      legendContainerView.backgroundColor = .secondaryBackground
      chartView.backgroundColor = .clear
      
      
      view.addSubview(legendContainerView)
      legendContainerView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(addButton)
      addButton.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(dateLabel)
      dateLabel.translatesAutoresizingMaskIntoConstraints = false
      
      addButton.tintColor = .secondaryText
      addButton.imageView?.contentMode = .scaleAspectFill
      
      legendContainerView.addSubview(legendCollectionView)
      legendCollectionView.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(chartView)
      chartView.translatesAutoresizingMaskIntoConstraints = false
      
      let marginsGuide = view.layoutMarginsGuide
      
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
      
      
      NSLayoutConstraint.activate([
         
         addButton.topAnchor.constraint(equalTo: marginsGuide.topAnchor,
                                        constant: 8),
         addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
         addButton.heightAnchor.constraint(equalToConstant: 52),
         addButton.widthAnchor.constraint(equalToConstant: 52),
         //
         legendContainerView.topAnchor.constraint(equalTo: marginsGuide.topAnchor,
                                           constant: 8),
         legendContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 8),
         legendContainerView.trailingAnchor.constraint(equalTo: addButton.leadingAnchor,
                                                constant: -8),
         legendContainerView.heightAnchor.constraint(equalToConstant: 52),
         
         
         //
         legendCollectionView.topAnchor.constraint(equalTo: legendContainerView.topAnchor,
                                                       constant: 4),
         legendCollectionView.leadingAnchor.constraint(equalTo: legendContainerView.leadingAnchor,
                                                           constant: 4),
         
         
         legendCollectionView.trailingAnchor.constraint(equalTo: legendContainerView.trailingAnchor,
                                                            constant: -4),
         
         
         legendCollectionView.bottomAnchor.constraint(equalTo: legendContainerView.bottomAnchor,
                                                          constant: -4),
         
         //
         
         chartView.topAnchor.constraint(equalTo: legendContainerView.bottomAnchor, constant: 4),
         chartView.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor, constant: -2),
         chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
      ])
      
      legendContainerView.layer.cornerRadius = 8
      presenter.requestData()
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      dateLabelWidthConstraint.constant = dateLabel.intrinsicContentSize.width
      dateLabelWidthConstraint.isActive = true
      
      moveTabBarDuringOrientationChange()
      moveNavigationBarDuringOrientationChange()
      
   }
   
   func chartValueSelected(_ chartView: ChartViewBase,
                           entry: ChartDataEntry,
                           highlight: Highlight) {
      
      let date = Date(timeIntervalSince1970: entry.x)
      let dataSets = chartView.data!.dataSets
      
      let legendItems: [LegendItem] = dataSets.map ({ dataSet in
         let y = dataSet.entryForXValue(entry.x, closestToY: 0)!.y
         return LegendItem(name: dataSet.label!,
                           highlightedValue: y.percentageString,
                            color: dataSet.colors.first!)
      })
      self.legendItems = legendItems
      self.dateLabel.text = date.uiStringYearFirst
      dateLabelConstraint.constant = highlight.xPx
   }
}

extension PortfolioChartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return legendItems.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LegendItemCell.reuseID, for: indexPath) as! LegendItemCell
      let legendItem = legendItems[indexPath.row]
      cell.configure(dataSetName: legendItem.name,
                     value: legendItem.highlightedValue,
                     color: legendItem.color)
      cell.backgroundColor = .clear
      return cell
   }
}
