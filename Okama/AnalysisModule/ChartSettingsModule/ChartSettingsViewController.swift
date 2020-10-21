//
//  ChartSettingsViewController.swift
//  Okama
//
//  Created by Pro13 on 13.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

protocol ChartSettingsDelegate {
   func setItem(atIndex index: Int, selected: Bool)
   var isLogarithmic: Bool { get set }
}

class ChartSettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   var delegate: ChartSettingsDelegate!
   var labels: [SelectionItem<String>] = []
   var isLogarithmic: Bool!
   
   let tableView = UITableView()
   
   convenience init(labels: [SelectionItem<String>] = [],
                    isLogarithmic: Bool,
                    delegate: ChartSettingsDelegate) {
      self.init(nibName: nil, bundle: nil)
      self.labels = labels
      self.isLogarithmic = isLogarithmic
      self.delegate = delegate
   }
   override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
      
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      
      let margins = view.layoutMarginsGuide
      
      NSLayoutConstraint.activate([
         tableView.topAnchor.constraint(equalTo: margins.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
      ])
      
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
      tableView.allowsMultipleSelection = true
   }
   
   func tableView(_ tableView: UITableView,
                  numberOfRowsInSection section: Int) -> Int {
      
      labels.count + 1
      
   }
   
   func tableView(_ tableView: UITableView,
                  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.row == 0 {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
         cell?.textLabel?.text = "Logarithmic scale"
         cell?.accessoryType = isLogarithmic ? .checkmark : .none
         cell?.selectionStyle = .none
         return cell!
      } else {
         let index = indexPath.row - 1
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
         cell?.textLabel?.text = labels[index].item
         cell?.accessoryType = labels[index].isSelected ? .checkmark : .none
         cell?.selectionStyle = .none
         return cell!
      }
      
      
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: false)
      
      if indexPath.row == 0 {
         isLogarithmic = !isLogarithmic
         delegate.isLogarithmic = isLogarithmic
         tableView.reloadData()
      } else {
         let index = indexPath.row - 1
         labels[index].isSelected = !labels[index].isSelected
         delegate.setItem(atIndex: index,
                          selected: labels[index].isSelected)
         tableView.reloadData()
      }
   }
}
