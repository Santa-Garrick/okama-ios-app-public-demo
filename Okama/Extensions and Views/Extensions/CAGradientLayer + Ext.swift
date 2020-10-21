//
//  CAGradientLayer + extension.swift
//  Okama
//
//  Created by Pro13 on 10.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

extension CAGradientLayer {
   convenience init(withColors colors: [CGColor],
                    frame: CGRect = .zero,
                    startPoint: CGPoint,
                    endPoint: CGPoint) {
      self.init()
      
      self.frame = frame
      self.colors = colors
      self.startPoint = startPoint
      self.endPoint = endPoint
   }
   
}

extension UIView {
   func fillLayerWith(gradientLayer: CAGradientLayer) {
      layer.frame = self.frame
      layer.addSublayer(gradientLayer)
   }
}
