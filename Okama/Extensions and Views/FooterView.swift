//
//  FooterView.swift
//  Okama
//
//  Created by Pro13 on 22.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class FooterView: UIView {
   
   private var textLabel: UILabel = {
      let label = UILabel()
      label.numberOfLines = 0
      label.font = UIFont.systemFont(ofSize: 14)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = #colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.662745098, alpha: 1)
      return label
   }()
   
   private var activityIndicator: UIActivityIndicatorView = {
      let activityIndicator = UIActivityIndicatorView()
      activityIndicator.translatesAutoresizingMaskIntoConstraints = false
      activityIndicator.hidesWhenStopped = true
      return activityIndicator
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupLayout()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      setupLayout()
   }
   
   private func setupLayout() {
      addSubview(textLabel)
      addSubview(activityIndicator)
      
      let constraints = [
         activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 8),
         activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
         
         textLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: 20),
         textLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                             constant: -20),
         textLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 8)
         
      ]
      
      _ = constraints.map { $0.priority = UILayoutPriority(999) }
      
      NSLayoutConstraint.activate(constraints)
      
   }
   
   func setText(_ text: String) {
      textLabel.text = text
   }
   
   func showLoader() {
      activityIndicator.startAnimating()
      textLabel.text = "loading"
   }
   func hideLoader() {
      activityIndicator.stopAnimating()
      textLabel.text = ""
   }
}

