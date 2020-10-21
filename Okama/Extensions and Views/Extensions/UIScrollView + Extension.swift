//
//  UIScrollView + Extension.swift
//  Okama
//
//  Created by Pro13 on 25.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
   
   func scrollToBottom(animated: Bool) {

      let height = frame.size.height
      let contentHeight = contentSize.height
      
      let y: CGFloat = contentHeight > height ? contentHeight - height : 0
            
      setContentOffset(CGPoint(x: 0, y: y), animated: animated)
   }
}

