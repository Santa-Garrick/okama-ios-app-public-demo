//
//  GlossaryViewController.swift
//  Okama
//
//  Created by Pro13 on 26.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class GlossaryViewController: UITableViewController {
   
   let fetcher = LocalDataFetcher()
      
   var terms = [Term]() {
      didSet {
         tableView.reloadData()
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
            
      tableView.register(UITableViewCell.self,
                         forCellReuseIdentifier: "glossaryItemCell")
      
      fetcher.fetchTerms { [weak self] (result) in
         switch result {
            
         case .success(let terms):
            self?.terms = terms
         case .failure(let error):
            print(error.localizedDescription)
         }
      }
   }
   
   // MARK: - Table view data source
   
   override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return terms.count
   }
   
   
   override func tableView(_ tableView: UITableView,
                           cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "glossaryItemCell", for: indexPath)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = terms[indexPath.row].title
      cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
      return cell
   }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      routeTo(term: terms[indexPath.row])
   }
   
   // MARK: - Navigation

   func routeToTerm(withURL url: URL?) {
      guard let url = url else { return }
      
      let term = terms.filter{ $0.url! == url.absoluteString }.first
      
      
      routeTo(term: term)
   }
   
   func routeTo(term: Term?) {
      guard let term = term else { return }

      let desciptionVC = DescriptionViewController()

      desciptionVC.term = term
      desciptionVC.completion = { [weak self] url in
         self?.routeToTerm(withURL: url)
      }
      
      if navigationController?.topViewController != self {
         navigationController?.popViewController(animated: true)
      }
      navigationController?.pushViewController(desciptionVC, animated: true)
   }
   
}
