//
//  UILabel + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 22.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UILabel {
	
   convenience init(text: String?,
                    font: UIFont? = UIFont.systemFont(ofSize: 12),
                    textColor: UIColor = UIColor.mainText,
                    numberOfLines: Int = 0,
                    textAlignment: NSTextAlignment = .left ) {
		self.init()
		self.text = text
		self.font = font
      self.textColor = textColor
      self.numberOfLines = numberOfLines
      self.textAlignment = textAlignment
	}
   func maxNumberOfLines(forWidth width: CGFloat) -> Int {
      let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
      let text = (self.text ?? "") as NSString
      let textHeight = text.boundingRect(with: maxSize,
                                         options: .usesLineFragmentOrigin,
                                         attributes: [.font: font!],
                                         context: nil).height
      let lineHeight = font.lineHeight
      return Int(ceil(textHeight / lineHeight))
   }
   
   var maxNumberOfLines: Int {
      return maxNumberOfLines(forWidth: frame.size.width)
   }
   
   func height(forText text: String, width: CGFloat) -> CGFloat {
      let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
      let text = text as NSString
      return text.boundingRect(with: maxSize,
                               options: .usesLineFragmentOrigin,
                               attributes: [.font: font!],
                               context: nil).height
   }
	
}
