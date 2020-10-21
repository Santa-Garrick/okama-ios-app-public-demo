//
//  PortfolioListViewController + Extension.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension PortfolioListViewController: UITableViewDataSource, UITableViewDelegate {

   func numberOfSections(in tableView: UITableView) -> Int {
      portfolios.count
   }
   
   func tableView(_ tableView: UITableView,
                  numberOfRowsInSection section: Int) -> Int {
      
      return portfolios[section].input.assets.count + 1 + 1
   }
   
   func tableView(_ tableView: UITableView,
                  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let section = indexPath.section
      let row = indexPath.row
      let portfolio = portfolios[section]

      
      if row == 0 {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: TitleCellWithInsets.reuseID) as! TitleCellWithInsets
         
         cell.configureWith(title: portfolio.input.name ?? "Portfolio \(section + 1)")
         cell.setBackground(color: .mainBackground,
                            insets: sectionInsets.forTableViewTopCell,
                            radius: 12,
                            corners: CACornerMask.forTableViewTopCell)
         
         return cell
         
      } else if row == tableView.numberOfRows(inSection: section) - 1 {
         let cell = tableView.dequeueReusableCell(withIdentifier: PerformanceCellWithInsets.reuseID) as! PerformanceCellWithInsets
         
         cell.configureWith(startDate: portfolio.input.conditions.startDate ?? Date(),
                           currency: portfolio.input.conditions.currency,
                           performance: portfolio.basicAnalysis!)
      
         cell.setBackground(color: .mainBackground,
                            insets: sectionInsets.forTableViewBottomCell,
                            radius: 12,
                            corners: CACornerMask.forTableViewBottomCell)
         
         return cell
         
      } else {
         

         let asset = portfolio.input.assets[row - 1]
         let cell = tableView.dequeueReusableCell(withIdentifier: AssetCellWithInsets.reuseID) as! AssetCellWithInsets
         
         cell.configureWith(title: asset.asset.title,
                           id: asset.asset.identifier,
                           exchange: asset.asset.exchange ?? "",
                           weight: asset.weight)
         
         cell.setBackground(color: .mainBackground,
                            insets: sectionInsets.forTableViewMiddleCell,
                            radius: 12,
                            corners: CACornerMask.forTableViewMiddleCell)
         return cell
      }
      
      
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      router?.routeToPortfolio(atIndex: indexPath.section)      
   }
   
}
