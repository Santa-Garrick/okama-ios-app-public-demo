//
//  AssetsViewController.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class AssetsViewController: UITableViewController {
         
   var presenter: (ConstructorPresenting & SearchDelegate)!
   var router: AssetsRouting!
   
   static let cellId = "AssetInputCell"

   private var assets: [WeighedAsset] = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      initialSetupTableView()
   }
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      presenter.updateAssets()
   }
   
   private func initialSetupTableView() {
      tableView.separatorStyle = .singleLine
      tableView.separatorInset = UIEdgeInsets(top: 0,
                                              left: 8,
                                              bottom: 0,
                                              right: 8)
      tableView.backgroundColor = .mainBackground
      tableView.dataSource = self
      tableView.delegate = self
      tableView.rowHeight = UITableView.automaticDimension
      tableView.estimatedRowHeight = 80
      
      tableView.register(AssetInputCell.self,
                         forCellReuseIdentifier: AssetsViewController.cellId)
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
   }

   // MARK: - Table view data source
   override func tableView(_ tableView: UITableView,
                           numberOfRowsInSection section: Int) -> Int {
      return assets.count + 1 // +1 for add-new cell
   }
   
   override func tableView(_ tableView: UITableView,
                           cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.row < assets.count {
         let cell = tableView.dequeueReusableCell(withIdentifier: AssetsViewController.cellId) as? AssetInputCell
			
         cell?.configureWith(asset: assets[indexPath.row])
			
         return cell ?? UITableViewCell()
      } else {
         return UITableViewCell(image: UIImage(systemName: "plus.circle"),
                                imageTintColor: .fillBlue,
                                text: K.Constructor.addNew,
                                font: .systemFont(ofSize: 12,
                                                  weight: .light),
                                textColor: .secondaryText,
                                backgroundColor: .clear)
      }
   }
   
   
   // MARK: Headers and supplemetary
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      return SectionHeaderView(with: self.tableView(tableView,
                                                    titleForHeaderInSection: section),
                               backgroundColor: .secondaryBackground)
   }
   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      SectionHeaderView.height
   }
   override func tableView(_ tableView: UITableView,
                           titleForHeaderInSection section: Int) -> String? {
      return K.Constructor.header
   }
   
   // MARK: Cell taps logic
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      if indexPath.row == assets.count {
         router.routeToSearch()
      } else {
         router.routeToEditWeight(atIndex: indexPath.row)
      }
      tableView.deselectRow(at: indexPath, animated: true)
      
   }
   
   // MARK: Delete logic
   override func tableView(_ tableView: UITableView,
                           commit editingStyle: UITableViewCell.EditingStyle,
                           forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         presenter?.remove(assetAtindex: indexPath.row)
      }
   }
   
   override func tableView(_ tableView: UITableView,
                           editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      return .delete
   }
   override func tableView(_ tableView: UITableView,
                           canEditRowAt indexPath: IndexPath) -> Bool {

      return assets.indices.contains(indexPath.row)
   }
}

// MARK: - AssetsDisplaying methods
extension AssetsViewController: AssetsDisplaying {
   func display(assets: [WeighedAsset]) {
      self.assets = assets
      tableView.reloadData()
   }
   
   func displayRemoving(assetAtIndex index: Int) {
      assets.remove(at: index)
      let indexPath = IndexPath(row: index, section: 0)
      tableView.deleteRows(at: [indexPath], with: .fade)
   }
}
