//
//  PeriodCell.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class PeriodCell: ContentCollectionViewCell {
   static let reuseID = "PeriodCell"

   override func setupLayout() {
      super.setupLayout()
      NSLayoutConstraint.activate([
         contentLabel.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 4),
         contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 6),
//         contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
//                                                constant: -6),
         contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                              constant: -4)
      ])
      
   }
}

