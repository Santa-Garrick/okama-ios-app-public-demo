//
//  UIView + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 25.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIView {
   
   
   func applyGradients(cornerRadius: CGFloat) {
      self.backgroundColor = nil
      self.layoutIfNeeded()
      let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
      if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
         gradientLayer.frame = self.bounds
         gradientLayer.cornerRadius = cornerRadius
         self.layer.insertSublayer(gradientLayer, at: 0)
      }
   }
   
   func hideSubviews() {
      _ = subviews.map { $0.isHidden = true }
   }
   func showSubviews() {
      _ = subviews.map { $0.isHidden = true }
   }
}

class LoadingView: UIView {
   
   private var indicator: UIActivityIndicatorView!
   private var textLabel: UILabel!
   
   convenience init(backgroundColor: UIColor,
                    indicatorColor: UIColor? = nil,
                    cornerRadius: CGFloat,
                    textColor: UIColor,
                    font: UIFont) {
      
      self.init(frame: .zero)
      self.backgroundColor = backgroundColor
      self.alpha = 0.9
      indicator = UIActivityIndicatorView(color: indicatorColor,
                                          hidesWhenStopped: true)
      textLabel = UILabel(text: "",
                          font: font,
                          textColor: textColor,
                          numberOfLines: 0,
                          textAlignment: .center)
      
      addSubview(indicator)
      addSubview(textLabel)
      
      indicator.translatesAutoresizingMaskIntoConstraints = false
      textLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         indicator.heightAnchor.constraint(equalToConstant: 20),
         indicator.widthAnchor.constraint(equalToConstant: 20),
         indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
         indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
         
         textLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: 4),
         textLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                            constant: -6),
         textLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                            constant: -4),

      ])
      
      layer.cornerRadius = cornerRadius
      isHidden = true
   }
   
   func startAnimating(withText text: String = "") {
      indicator.startAnimating()
      textLabel.text = text
      isHidden = false
   }
   func stopAnimating() {
      indicator.stopAnimating()
      isHidden = true
   }
}
