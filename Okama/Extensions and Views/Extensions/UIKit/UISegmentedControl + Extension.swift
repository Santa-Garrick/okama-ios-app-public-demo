//
//  UISegmentedControl + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 23.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit


extension UISegmentedControl {
	
	convenience init(first: String, second: String) {
		self.init()
		self.translatesAutoresizingMaskIntoConstraints = false
		
		self.insertSegment(withTitle: first, at: 0, animated: true)
		self.insertSegment(withTitle: second, at: 1, animated: true)
		self.selectedSegmentIndex = 0
	}
	
}
