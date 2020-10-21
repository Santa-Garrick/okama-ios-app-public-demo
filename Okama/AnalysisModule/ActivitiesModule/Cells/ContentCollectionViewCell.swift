//
//  ContentCollectionViewCell.swift
//  Okama
//
//  Created by Pro13 on 10.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class ContentCollectionViewCell: UICollectionViewCell {
   
   var contentLabel = UILabel(text: "",
                                      font: .systemFont(ofSize: 11,
                                                        weight: .light),
                                      numberOfLines: 0)
   
   override func prepareForReuse() {
      super.prepareForReuse()
      contentLabel.removeFromSuperview()
   }
   
   func configure(withText text: String,
                  font: UIFont,
                  textAlignment: NSTextAlignment) {
      
      contentLabel.text = text
      contentLabel.font = font
      contentLabel.textAlignment = textAlignment
      setupLayout()
   }
   
   func setupLayout() {
      addSubview(contentLabel)
      contentLabel.translatesAutoresizingMaskIntoConstraints = false
            
      
   }
}


