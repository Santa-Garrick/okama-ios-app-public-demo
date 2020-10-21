//
//  AssetInputCell.swift
//  Okama
//
//  Created by Pro13 on 23.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class AssetInputCell: UITableViewCell {
      
   private let titleLabel = UILabel(text: "",
                                    font: .systemFont(ofSize: 15,
                                                      weight: .regular),
                                    numberOfLines: 0)
   private let weightLabel = UILabel(text: "",
                                     font: .systemFont(ofSize: 15,
                                                       weight: .regular),
                                     numberOfLines: 0,
                                     textAlignment: .right)

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
      setupConstraints()
      backgroundColor = .clear
      
   }
   
   private func setupViews() {
      contentView.addSubview(titleLabel)
      contentView.addSubview(weightLabel)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
	func configureWith(asset: WeighedAsset) {
		titleLabel.text = asset.asset.title
		weightLabel.text = asset.weight.roundedPercentage + "%"
	}
   
   func setupConstraints() {
      
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      weightLabel.translatesAutoresizingMaskIntoConstraints = false
      
      let constraints = [
         titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                         constant: 8),

         titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                             constant: 14),
         titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
         titleLabel.trailingAnchor.constraint(equalTo: weightLabel.leadingAnchor,
                                              constant: -14),
         
         weightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -14),
         weightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         weightLabel.widthAnchor.constraint(equalToConstant: 38),
   
      ]
      
      _ = constraints.map { $0.priority = UILayoutPriority(999) }
      
      NSLayoutConstraint.activate(constraints)
   }
}

extension NSLayoutConstraint {
   static func activate(constraints: [NSLayoutConstraint],
								withPriority priority: UILayoutPriority) {
   
      _ = constraints.map { $0.priority = priority }
      activate(constraints)
   }
}
