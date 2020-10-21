//
//  TitleCell.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class TitleCell: ContentCollectionViewCell {
   static let reuseID = "TitleCell"

   override func setupLayout() {
      super.setupLayout()

      insertRightSeparator(color: #colorLiteral(red: 0.3172217906, green: 0.3172217906, blue: 0.3172217906, alpha: 1))
      if contentLabel.maxNumberOfLines(forWidth: frame.size.width - 10) == 1 {
         NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
         ])
      } else {

         NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: topAnchor,
                                              constant: 4),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: 6),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -6),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                 constant: -4)
         ])
      }
   }
}
