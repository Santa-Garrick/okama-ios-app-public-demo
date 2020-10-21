//
//  SearchCell.swift
//  Okama
//
//  Created by Pro13 on 24.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
      
   static let reuseID = "SearchCell"
   static let height: CGFloat = 48
   
   private let titleLabel = UILabel(text: "",
                                    font: .systemFont(ofSize: 15,
                                                      weight: .regular))
   private let idLabel = UILabel(text: "",
                                 font: .systemFont(ofSize: 10,
                                                   weight: .light),
                                 textAlignment:  .right)
   private let exchangeLabel = UILabel(text: "",
                                       font: .systemFont(ofSize: 8,
                                                         weight: .light),
                                       textAlignment: .right)
   
   private let selectionImageView = UIImageView()
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      if selected {
         let image = UIImage(systemName: "checkmark.circle.fill")
         selectionImageView.image = image
         selectionImageView.tintColor =  .fillGreen
      } else {
         let image = UIImage(systemName: "plus.circle")
         selectionImageView.image = image
         selectionImageView.tintColor = .fillBlue
      }
      
   }
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      selectionStyle = .none
      setupViews()
      setupConstraints()
      backgroundColor = .clear
      
   }
   
   private func setupViews() {
      addSubview(titleLabel)
      addSubview(idLabel)
      addSubview(exchangeLabel)
      addSubview(selectionImageView)

   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func populateWith(title: String,
                     id: String,
                     exchange: String) {
      
      titleLabel.text = title
      idLabel.text = id
      exchangeLabel.text = exchange
      
   }
   
   func setupConstraints() {
      
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      idLabel.translatesAutoresizingMaskIntoConstraints = false
      exchangeLabel.translatesAutoresizingMaskIntoConstraints = false
      selectionImageView.translatesAutoresizingMaskIntoConstraints = false
      
      let constraints = [
         titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                             constant: 14),
         titleLabel.trailingAnchor.constraint(equalTo: idLabel.leadingAnchor,
                                              constant: -2),
         titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),

         idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
         idLabel.trailingAnchor.constraint(equalTo: selectionImageView.leadingAnchor,
                                           constant: -8),
         idLabel.bottomAnchor.constraint(equalTo: centerYAnchor,
                                           constant: -2),
         idLabel.widthAnchor.constraint(equalToConstant: 60),
         
         exchangeLabel.trailingAnchor.constraint(equalTo: selectionImageView.leadingAnchor,
                                                 constant: -8),
         exchangeLabel.topAnchor.constraint(equalTo: centerYAnchor,
                                            constant: 2),
         exchangeLabel.widthAnchor.constraint(equalToConstant: 60),
         exchangeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
         
         selectionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
         selectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
         selectionImageView.heightAnchor.constraint(equalToConstant: 22),
         selectionImageView.widthAnchor.constraint(equalToConstant: 22)
      ]
      
      NSLayoutConstraint.activate(constraints: constraints,
                                  withPriority: UILayoutPriority(rawValue: 999))
   
   }
}

