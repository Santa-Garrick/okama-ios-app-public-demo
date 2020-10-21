//
//  PortfolioListViewController.swift
//  Okama
//
//  Created by Pro13 on 31.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

protocol PortfolioListDataStore {
   var portfolios: [Portfolio] { get }
}
class PortfolioListViewController: UIViewController, PortfolioListDataStore {
   
   var portfolios: [Portfolio] = []
   
   var auth: AuthServiceProtocol!
   var dataFetcher: PortfolioListFetching!
   
   var router: PortfolioListRouting!
   
   var tableView = UITableView(frame: .zero, style: .plain)
      
   let sectionInsets = UIEdgeInsets(top: 4,
                                    left: 4,
                                    bottom: -4,
                                    right: -4)
   
   var isRefreshing: Bool = false
   
   func createLogOutButton() {
      let button = UIBarButtonItem(title: "Log out",
                                   style: .done,
                                   target: self,
                                   action: #selector(logoutTapped))
      navigationItem.rightBarButtonItem = button
   }
   
   @objc private func logoutTapped() {
      auth.logout { [weak self] in
         self?.showAlert(withTitle: "Logged out",
                         message: "", completion: {
                           self?.dismiss(animated: true)
         })
      }
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      view.addSubview(tableView)
      
      setupTableView()
      setupLayout()
      fetchData()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      if isRefreshing {
         tableView.refreshControl?.beginRefreshing()
         let control = tableView.refreshControl!
         let offset = CGPoint(x: 0, y: -control.frame.size.height)
         tableView.setContentOffset(offset, animated: true)
      }
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      tableView.refreshControl?.endRefreshing()
   }
   
   private func setupTableView() {
      tableView.separatorStyle = .singleLine
      tableView.separatorInset = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 20)
      tableView.backgroundColor = .secondaryBackground
      
      tableView.dataSource = self
      tableView.delegate = self
      
      tableView.rowHeight = UITableView.automaticDimension
      
      tableView.register(AssetCellWithInsets.self,
                         forCellReuseIdentifier: AssetCellWithInsets.reuseID)
      tableView.register(TitleCellWithInsets.self,
                         forCellReuseIdentifier: TitleCellWithInsets.reuseID)
      tableView.register(PerformanceCellWithInsets.self,
                         forCellReuseIdentifier: PerformanceCellWithInsets.reuseID)
      
      
      tableView.refreshControl = UIRefreshControl()
      tableView.refreshControl?.addTarget(self,
                                          action: #selector(self.refresh(_:)),
                                          for: .valueChanged)
      tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Loading")
   }
   
   private func setupLayout() {
      tableView.translatesAutoresizingMaskIntoConstraints = false
      
      let margins = view.layoutMarginsGuide

      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: margins.topAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)

      ])
   }
   
   private func fetchData() {
     
      isRefreshing = true
      tableView.refreshControl?.beginRefreshing()
      dataFetcher.fetchPortfolioList { [weak self] (result) in
         
         guard let self = self else { return }
         
         self.isRefreshing = false
         switch result {
         case .success(let portfolios):
            self.portfolios = portfolios
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
         case .failure(let error):
				print("recieve error:", error)
				print("loc desc:", error.localizedDescription)
            self.showAlert(withTitle: "Error", message: error.localizedDescription) {
               self.tableView.refreshControl?.endRefreshing()
            }
         }
      }
   }
   
   @objc func refresh(_ sender: AnyObject) {
      fetchData()
   }
}

