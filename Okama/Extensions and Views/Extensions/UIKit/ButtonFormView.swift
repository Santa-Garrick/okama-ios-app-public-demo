//
//  ButtonFormView.swift
//  ChatTutorial
//
//  Created by Pro13 on 22.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

class ButtonFormView: UIView {
   init(label: UILabel, button: UIButton, buttonHeight: CGFloat) {
		super.init(frame: .zero)
		
		self.addSubview(label)
		self.addSubview(button)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		button.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: topAnchor),
			label.leadingAnchor.constraint(equalTo: leadingAnchor)
		])
		NSLayoutConstraint.activate([
			button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
			button.leadingAnchor.constraint(equalTo: leadingAnchor),
			button.trailingAnchor.constraint(equalTo: trailingAnchor),
			button.heightAnchor.constraint(equalToConstant: buttonHeight)
		])
		bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
		
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
