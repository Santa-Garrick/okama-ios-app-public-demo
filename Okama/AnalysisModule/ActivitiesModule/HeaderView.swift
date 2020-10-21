//
//  HeaderView.swift
//  Okama
//
//  Created by Pro13 on 13.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
   static let kind = "HeaderView"
   static let reuseID = "HeaderView"
   
   var titleLabel = UILabel(text: "",
                            font: .systemFont(ofSize: 11,
                                              weight: .light),
                            textColor: .secondaryText,
                            numberOfLines: 0)
   
   
   override func layoutSubviews() {

      addSubview(titleLabel)
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
         titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
      ])
   }
}
