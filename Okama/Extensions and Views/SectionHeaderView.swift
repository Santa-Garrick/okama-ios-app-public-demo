//
//  SectionHeaderView.swift
//  Okama
//
//  Created by Pro13 on 25.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
   
   static let height: CGFloat = 28
   let label = UILabel(text: "",
                       font: UIFont.systemFont(ofSize: 14, weight: .regular),
                       textColor: .secondaryLabel,
                       numberOfLines: 0)
      
   convenience init(with title: String?,
                    andButton button: UIButton? = nil,
                    backgroundColor: UIColor = .clear) {
      
      self.init(frame: .zero)
      
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = title
      addSubview(label)
      NSLayoutConstraint.activate([
         label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
         label.leadingAnchor.constraint(equalTo: leadingAnchor,
                                        constant: 20)
      ])
      
      if let button = button {
         addSubview(button)
         button.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor,
                                             constant: -10),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 60)
         ])
      }
      
      self.backgroundColor = backgroundColor
   }
   
}
