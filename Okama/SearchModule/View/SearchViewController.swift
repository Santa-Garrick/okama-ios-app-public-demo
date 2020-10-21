//
//  ViewController.swift
//  Okama
//
//  Created by Pro13 on 20.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchDisplaying {
   
   
   
   // MARK: Dependencies
   var presenter: SearchPresenterProtocol!
   
   // MARK: Models
   private var assets: [SearchAsset] = []
   
   
   // MARK: UI elements
   private let tableView = UITableView()
   private let footerView = FooterView()
   private let searchBar = UISearchBar()
   private var timer: Timer?
   
   // MARK: UI setup, view lifecycle
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      setupNavigationBar()
      setupSearchBar()
      setupTableView()
      searchBar.becomeFirstResponder()
   }
   private func setupNavigationBar() {
      let left = UIBarButtonItem.init(barButtonSystemItem: .cancel,
                                      target: self,
                                      action: #selector(cancelTapped))
      let right = UIBarButtonItem.init(barButtonSystemItem: .done,
                                       target: self,
                                       action: #selector(okTapped))
      navigationItem.leftBarButtonItem = left
      navigationItem.rightBarButtonItem = right
   }
   private func setupSearchBar() {

      view.addSubview(searchBar)
      searchBar.translatesAutoresizingMaskIntoConstraints = false
      searchBar.placeholder = NSLocalizedString("enterNewAssetPlaceholder",
                                                comment: "enterNewAssetPlaceholder")
      searchBar.delegate = self
      let height = navigationController?.navigationBar.frame.size.height ?? 0
      NSLayoutConstraint.activate([
         searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: height),
         searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         searchBar.heightAnchor.constraint(equalToConstant: 45)
      ])

   }
   private func setupTableView() {
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.backgroundColor = .mainBackground
      tableView.dataSource = self
      tableView.delegate = self
      tableView.allowsMultipleSelection = true
      
      tableView.register(SearchCell.self,
                         forCellReuseIdentifier: SearchCell.reuseID)
      tableView.rowHeight = UITableView.automaticDimension
      tableView.estimatedRowHeight = SearchCell.height
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
      tableView.tableFooterView = footerView
   }
   // MARK: Actions
   @objc private func cancelTapped() {
      dismiss(animated: true, completion: nil)
   }
   @objc private func okTapped() {
      presenter.okTapped()
      dismiss(animated: true, completion: nil)
   }
   
   private func makeSearchQuery(with searchText: String) {
      footerView.showLoader()
      presenter.requestData(forSearchText: searchText)
   }
   // MARK: SearchViewProtocol methods
   func display(assets: [SearchAsset]) {
      self.assets = assets
      footerView.hideLoader()
      tableView.reloadData()
      
   }
   func display(title: String) {
      self.title = title
   }
   
   func display(message: String) {
      footerView.setText(message)
   }
   
}

// MARK: DataSource & Delegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
   func tableView(_ tableView: UITableView,
                  numberOfRowsInSection section: Int) -> Int {
      return assets.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseID) as! SearchCell
      
      let asset = assets[indexPath.row]
      cell.populateWith(title: asset.title,
                        id: asset.identifier,
                        exchange: asset.exchange ?? "")
      
      if asset.isAdded {
         tableView.selectRow(at: indexPath,
                             animated: false,
                             scrollPosition: .none)
      }
      return cell
   }
   
   func tableView(_ tableView: UITableView,
                  didSelectRowAt indexPath: IndexPath) {
      presenter.selectItem(atIndex: indexPath.row)
   }
   func tableView(_ tableView: UITableView,
                  didDeselectRowAt indexPath: IndexPath) {
      presenter.deselectItem(atIndex: indexPath.row)
   }
   func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
      view.endEditing(true)
   }
}

// MARK: SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
   func searchBar(_ searchBar: UISearchBar,
                  textDidChange searchText: String) {
      
      timer?.invalidate()
      timer = Timer.scheduledTimer(withTimeInterval: 0.5,
                                   repeats: false) { [weak self] _ in
         self?.makeSearchQuery(with: searchText)
      }
   }

}
