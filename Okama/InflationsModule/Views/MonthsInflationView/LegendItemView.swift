//
//  LegendItemView.swift
//  Okama
//
//  Created by Pro13 on 16.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class LegendItemView: UIView {
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
      addSubview(dataSetNameLabel)
      dataSetNameLabel.translatesAutoresizingMaskIntoConstraints = false
      
      addSubview(dataSetValueLabel)
      dataSetValueLabel.translatesAutoresizingMaskIntoConstraints = false
      
      addSubview(colorLabelView)
      colorLabelView.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         colorLabelView.centerYAnchor.constraint(equalTo: centerYAnchor),
         colorLabelView.leadingAnchor
            .constraint(equalTo: leadingAnchor,
                        constant: 4),
         colorLabelView.heightAnchor.constraint(equalToConstant: 6),
         colorLabelView.widthAnchor.constraint(equalToConstant: 6),
         
         dataSetNameLabel.centerYAnchor
            .constraint(equalTo: centerYAnchor),
         dataSetNameLabel.leadingAnchor
            .constraint(equalTo: colorLabelView.trailingAnchor,
                        constant: 5),
         dataSetNameLabel.trailingAnchor
            .constraint(equalTo: dataSetValueLabel.leadingAnchor,
                        constant: -1),
         
         dataSetValueLabel.centerYAnchor
            .constraint(equalTo: centerYAnchor),
         dataSetValueLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor,
                        constant: 70)
      ])
   }
   func configure(dataSetName: String, value: String, color: UIColor) {
      colorLabelView.backgroundColor = color
      dataSetNameLabel.text = dataSetName
      dataSetValueLabel.text = value
   }
}

