//
//  PerformanceCellWithInsets.swift
//  Okama
//
//  Created by Pro13 on 09.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class PerformanceCellWithInsets: CellWithInsets {

   static let reuseID = "PerformanceCellWithInsets"

   private let performanceView = PerformanceView()

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      setupViews()
      setupConstraints()
      backgroundColor = .clear
      
      
      bgView.addSubview(performanceView)
      performanceView.translatesAutoresizingMaskIntoConstraints = false
      
      let constraints = [
         performanceView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
         performanceView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8),
         performanceView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant:  -8),
         performanceView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10),
         
         performanceView.heightAnchor.constraint(equalToConstant: 92)
      ]
      
      _ = constraints.map({ $0.priority = UILayoutPriority(999)})
      NSLayoutConstraint.activate(constraints)

   }
   
   func setupViews() {}
   func setupConstraints() {}

   func configureWith(startDate: Date,
                     currency: Currency,
                     performance: Portfolio.BasicAnalysis) {

      performanceView.configureWith(startDate: startDate, currency: currency, performance: performance)

   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

}
