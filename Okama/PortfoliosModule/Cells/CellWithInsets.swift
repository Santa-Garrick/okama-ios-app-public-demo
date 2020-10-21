//
//  CellWithInsets.swift
//  Okama
//
//  Created by Pro13 on 09.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class CellWithInsets: UITableViewCell {
   
   var bgView = UIView()
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      bgView = UIView()
      selectionStyle = .none
      contentView.addSubview(bgView)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      bgView.removeFromSuperview()
      contentView.addSubview(bgView)
   }
   
   func setBackground(color: UIColor,
                      insets: UIEdgeInsets,
                      radius: CGFloat,
                      corners: CACornerMask) {
      setBackground(color: color)
      setInsets(insets)
      setCorners(radius: radius, corners: corners)
   }
   private func setBackground(color: UIColor) {
      bgView.backgroundColor = color
   }
   private func setInsets(_ insets: UIEdgeInsets) {
      
      bgView.translatesAutoresizingMaskIntoConstraints = false
      
      let top = insets.top
      let left = insets.left
      let right = insets.right
      let bottom = insets.bottom
      
      NSLayoutConstraint.activate([
         bgView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: top),
         bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: left),
         bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: right),
         bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: bottom),
      ])
      
   }
   private func setCorners(radius: CGFloat, corners: CACornerMask) {
      bgView.layer.cornerRadius = radius
      bgView.layer.masksToBounds = true
      bgView.layer.maskedCorners = corners
   }
   
}
