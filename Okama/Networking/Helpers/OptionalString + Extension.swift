//
//  String + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 27.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import Foundation
import UIKit

extension Optional where Wrapped == String {
	var notEmptyString: String? {
		guard
			let self = self,
			!self.isEmpty
			else { return nil }
		return self
	}
}


extension String {
   var isValidEmail: Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
      
      return predicate.evaluate(with: self)
   }
   
   
   func height(forFont font: UIFont, width: CGFloat) -> CGFloat {
      let maxSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
      let text = self as NSString
      return text.boundingRect(with: maxSize,
                               options: .usesLineFragmentOrigin,
                               attributes: [.font: font],
                               context: nil).height
   }
}

