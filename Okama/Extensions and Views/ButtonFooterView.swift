//
//  ButtonFooterView.swift
//  Okama
//
//  Created by Pro13 on 01.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class ButtonFooterView: UIView {

   convenience init(with button: UIButton) {
      self.init()
      addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         button.topAnchor.constraint(equalTo: topAnchor),
         button.bottomAnchor.constraint(equalTo: bottomAnchor),
         button.leadingAnchor.constraint(equalTo: leadingAnchor),
         button.trailingAnchor.constraint(equalTo: trailingAnchor)
      ])
   }
}
