//
//  UICollectionViewCell + Extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UICollectionViewCell {
   func insertRightSeparator(color: UIColor) {
      let separator = UIView()
      separator.backgroundColor = color
      contentView.addSubview(separator)
      separator.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         separator.widthAnchor.constraint(equalToConstant: 0.3),
         separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: -1),
         separator.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: 4),
         separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                           constant: -4)
      ])
      
      contentView.addSubview(separator)
   }
}
