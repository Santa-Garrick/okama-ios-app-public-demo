//
//  AssetCellWithInsets.swift
//  Okama
//
//  Created by Pro13 on 09.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class AssetCellWithInsets: CellWithInsets {

   var minimumHeight: CGFloat = 0 {
      didSet {
//         NSLayoutConstraint.activate(constraints: [
//            heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight)
//         ], withPriority: UILayoutPriority(999))
      }
   }

   static let reuseID = "AssetCellWithInsets"

   private let titleLabel = UILabel(text: "",
                                    font: .systemFont(ofSize: 13,
                                                      weight: .light),
                                    numberOfLines: 0)
   private let weightLabel = UILabel(text: "",
                                     font: .systemFont(ofSize: 14,
                                                       weight: .light),
                                     numberOfLines: 0,
                                     textAlignment: .right)

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
      setupConstraints()
      backgroundColor = .clear

   }


   func setFont(_ font: UIFont) {
      titleLabel.font = font
      weightLabel.font = font
   }

   private func setupViews() {

      bgView.addSubview(titleLabel)
      bgView.addSubview(weightLabel)
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   func configureWith(title: String,
                     id: String,
                     exchange: String,
                     weight: Double) {

      titleLabel.text = title
      weightLabel.text = weight.roundedPercentage + "%"
   }

   func setupConstraints() {
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      weightLabel.translatesAutoresizingMaskIntoConstraints = false

      let constraints = [
         titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor,
                                         constant: 8),

         titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor,
                                             constant: 24),
         titleLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5),
         titleLabel.trailingAnchor.constraint(equalTo: weightLabel.leadingAnchor,
                                              constant: -14),

         weightLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor,
                                               constant: -14),
         weightLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
         weightLabel.widthAnchor.constraint(equalToConstant: 38),

      ]

//      _ = constraints.map { $0.priority = UILayoutPriority(999) }

      NSLayoutConstraint.activate(constraints)
   }
}
