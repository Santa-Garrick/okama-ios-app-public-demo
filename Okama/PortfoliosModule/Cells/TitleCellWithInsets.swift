//
//  TitleCellWithInsets.swift
//  Okama
//
//  Created by Pro13 on 09.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class TitleCellWithInsets: CellWithInsets {

   var minimumHeight: CGFloat = 0 {
      didSet {
//         NSLayoutConstraint.activate(constraints: [
//            heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight)
//         ], withPriority: UILayoutPriority(999))
      }
   }

   static let reuseID = "TitleCellWithInsets"

   private let titleLabel = UILabel(text: "",
                                    font: .systemFont(ofSize: 16,
                                                      weight: .medium),
                                    numberOfLines: 0)

   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupViews()
      setupConstraints()
      backgroundColor = .clear

   }
   func setFont(_ font: UIFont) {
      titleLabel.font = font
   }

   private func setupViews() {
      bgView.addSubview(titleLabel)
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   func configureWith(title: String) {
      titleLabel.text = title
   }

   func setupConstraints() {
      titleLabel.translatesAutoresizingMaskIntoConstraints = false

      let constraints = [
         titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor,
                                         constant: 12),

         titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor,
                                             constant: 14),
         titleLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8),
         titleLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor,
                                              constant: -14)
      ]

//      _ = constraints.map { $0.priority = UILayoutPriority(999) }

      NSLayoutConstraint.activate(constraints)
   }
}
