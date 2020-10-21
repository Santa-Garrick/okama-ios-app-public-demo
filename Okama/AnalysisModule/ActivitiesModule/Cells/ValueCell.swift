//
//  ValueCell.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class ValueCell: ContentCollectionViewCell {
   static let reuseID = "ValueCell"

   override func setupLayout() {
      super.setupLayout()

      insertRightSeparator(color: #colorLiteral(red: 0.3172217906, green: 0.3172217906, blue: 0.3172217906, alpha: 1))
      NSLayoutConstraint.activate([
         contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
         contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
      ])
      
   }
}
