//
//  HighlightCell.swift
//  Okama
//
//  Created by Pro13 on 13.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class LegendItemCell: UICollectionViewCell {
   static let reuseID = "LegendItemCell"
   private var colorLabelView: UIView = {
      let view = UIView()
      view.layer.cornerRadius = 3
      view.layer.masksToBounds = true
      return view
   }()
   private var dataSetNameLabel = UILabel(text: "",
                                          font: .systemFont(ofSize: 11,
                                                            weight: .light),
                                          textColor: .mainText,
                                          numberOfLines: 1,
                                          textAlignment: .left)
   private var dataSetValueLabel = UILabel(text: "",
                                           font: .systemFont(ofSize: 11,
                                                             weight: .light),
                                           textColor: .mainText,
                                           numberOfLines: 1,
                                           textAlignment: .left)
   override func layoutSubviews() {
      contentView.addSubview(dataSetNameLabel)
      dataSetNameLabel.translatesAutoresizingMaskIntoConstraints = false
      
      contentView.addSubview(dataSetValueLabel)
      dataSetValueLabel.translatesAutoresizingMaskIntoConstraints = false
      
      contentView.addSubview(colorLabelView)
      colorLabelView.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         colorLabelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         colorLabelView.leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor,
                        constant: 2),
         colorLabelView.heightAnchor.constraint(equalToConstant: 6),
         colorLabelView.widthAnchor.constraint(equalToConstant: 6),
         
         dataSetNameLabel.topAnchor
            .constraint(equalTo: contentView.topAnchor),
         dataSetNameLabel.leadingAnchor
            .constraint(equalTo: colorLabelView.trailingAnchor,
                        constant: 3),
         dataSetNameLabel.trailingAnchor
            .constraint(equalTo: dataSetValueLabel.leadingAnchor,
                        constant: -1),
         
         dataSetValueLabel.topAnchor
            .constraint(equalTo: contentView.topAnchor),
         dataSetValueLabel.leadingAnchor
            .constraint(equalTo: contentView.centerXAnchor,
                        constant: 3)
      ])
   }
   func configure(dataSetName: String, value: String, color: UIColor) {
      colorLabelView.backgroundColor = color
      dataSetNameLabel.text = dataSetName
      dataSetValueLabel.text = value
   }
}

