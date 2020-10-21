//
//  StackView + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 22.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIStackView {
	convenience init(arrangedSubviews: [UIView],
                    axis: NSLayoutConstraint.Axis,
                    spacing: CGFloat) {
		
		self.init(arrangedSubviews: arrangedSubviews)
		self.axis = axis
		self.spacing = spacing
	}
}

