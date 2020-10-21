//
//  UIButton + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 21.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIButton {
   
   convenience init(image: UIImage) {
      
      self.init(type: .system)
      setImage(image, for: .normal)
   }
   
   convenience init(image: UIImage,
                    backgroundColor: UIColor,
                    cornerRadius: CGFloat) {
      
      self.init(type: .system)
      setImage(image, for: .normal)
      self.backgroundColor = backgroundColor
      self.layer.cornerRadius = cornerRadius
   }
   
   
	convenience init(title: String,
                    titleColor: UIColor,
                    backgroundColor: UIColor,
                    font: UIFont? = UIFont.systemFont(ofSize: 14),
                    hasShadow: Bool = false,
                    cornerRadius: CGFloat = 4,
                    image: UIImage? = nil) {
		
		self.init(type: .system)
		
		self.setTitle(title, for: .normal)
		self.setTitleColor(titleColor, for: .normal)
		self.titleLabel?.font = font
		self.backgroundColor = backgroundColor
		
		self.layer.cornerRadius = cornerRadius

		if hasShadow {
			self.setShadow()
		}
		
		if let image = image {
			addImage(image)
		}
	}
	private func addImage(_ image: UIImage) {
		let imageView = UIImageView(image: image, contentMode: .scaleAspectFit)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(imageView)

		NSLayoutConstraint.activate([
//			imageView.topAnchor.constraint(equalTo: self.topAnchor),
			imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24)
		])
		
	}
	private func setShadow() {
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowRadius = 4
		self.layer.shadowOpacity = 0.2
		self.layer.shadowOffset = CGSize(width: 0, height: 4)
	}
   
}

