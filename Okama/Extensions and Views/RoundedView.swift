//
//  RoundedView.swift
//  Okama
//
//  Created by Pro13 on 23.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    var corners: UIRectCorner = .allCorners
    var radius: CGFloat = 0.0
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: corners, radius: radius)
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
       let path = UIBezierPath(roundedRect: bounds,
                               byRoundingCorners: corners,
                               cornerRadii: CGSize(width: radius, height: radius))
       let mask = CAShapeLayer()
       mask.path = path.cgPath
       layer.mask = mask
    }
}
