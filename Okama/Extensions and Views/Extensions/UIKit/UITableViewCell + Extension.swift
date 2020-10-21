//
//  UITableViewCell + Extension.swift
//  Okama
//
//  Created by Pro13 on 17.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UITableViewCell {
   convenience init(image: UIImage?,
                    imageTintColor: UIColor = .fillBlue,
                    text: String?,
                    font: UIFont = .systemFont(ofSize: 12, weight: .light),
                    textColor: UIColor = UIColor.mainText,
                    backgroundColor: UIColor = .clear) {
      self.init()
      imageView?.image = UIImage(systemName: "plus.circle")
      imageView?.tintColor = .fillBlue
      
      textLabel?.text = text
      textLabel?.font = font
      textLabel?.textColor = textColor
      
      self.backgroundColor = backgroundColor
   }
}


