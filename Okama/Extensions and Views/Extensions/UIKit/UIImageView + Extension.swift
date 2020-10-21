//
//  UIImageView + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 22.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIImageView {
	convenience init(image: UIImage?, contentMode: ContentMode = .center) {
		self.init(image: image)
		self.contentMode = contentMode
	}
	
	func setupColor(color: UIColor) {
		let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
		self.image = templateImage
		self.tintColor = color
	}
}
