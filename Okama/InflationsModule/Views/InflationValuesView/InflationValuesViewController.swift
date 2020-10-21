//
//  InflationValuesViewController.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts


class InflationValuesViewController: ViewControllerWithLoadingView, CurrencyView {
   
   func showLoader() {
      collectionView?.isHidden = true
      startLoadingAnimation(with: "Loading")
   }
   
   func showData(inflation: Inflation) {
      stopLoadingAnimation()
      values = inflation.values ?? []
      collectionView?.isHidden = false
      collectionView?.reloadData()
   }
   
   
   var values: [ValuesByYear] = []
   
   var collectionView: UICollectionView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      
      collectionView = UICollectionView(frame: .zero,
                                        collectionViewLayout: CustomCollectionViewLayout())
      collectionView.isDirectionalLockEnabled = true
      collectionView.dataSource = self
      collectionView.delegate = self
      collectionView.register(ValueCell.self,
                              forCellWithReuseIdentifier: ValueCell.reuseID)
      
      collectionView.backgroundColor = .clear
      
      view.addSubview(collectionView)
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      
      let marginsGuide = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
         collectionView.topAnchor.constraint(equalTo: marginsGuide.topAnchor),
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         collectionView.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor)
      ])
      
   }
}

extension InflationValuesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return values.count + 1
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 14
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      // swiftlint:disable force_cast
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ValueCell.reuseID,
                                                    for: indexPath) as! ContentCollectionViewCell
      
      cell.backgroundColor = colorForSection(section: indexPath.section)
      
      let text = textFor(indexPath: indexPath)
      
      cell.configure(withText: text,
                     font: .systemFont(ofSize: 11,
                                       weight: .light),
                     textAlignment: .center)
      return cell
   }
   
   private func colorForSection(section: Int) -> UIColor {
      if section % 2 != 0 {
         return .mainBackground
      } else {
         return .absoluteBackground
      }
   }
   
   private func textFor(indexPath: IndexPath) -> String {
      
      let section = indexPath.section
      let row = indexPath.row
            
      if section == 0 {
         return textForTopSection(row: row)
      } else {
         return textForValueSections(indexPath: indexPath)
      }
   }
   
   private func textForTopSection(row: Int) -> String {
      
      assert((0 <= row && row <= 13), "wrong row number")
      
      if row == 0 {
         return  ""
      } else if row == 13 {
         return "Год"
      } else {
         return DateFormatter().shortMonthSymbols[row - 1]
      }
   }
   
   private func textForValueSections(indexPath: IndexPath) -> String {
      
      assert((0 <= indexPath.row && indexPath.row <= 13), "wrong row number")
      
      if indexPath.row == 0 {
         return "\(values[indexPath.section - 1].year)"
      } else if indexPath.row == 13 {
         return values[indexPath.section - 1].cumulative.percentageString
      } else {
         
         let valuesByYear = values[indexPath.section - 1]
         let valueString = valuesByYear.value(forMonth: indexPath.row)?.percentageString ?? ""
         
         return valueString.isEmpty ? "" : valueString
      }
   }
   
}
