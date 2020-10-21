//
//  UIWindow + Extension.swift
//  Okama
//
//  Created by Pro13 on 14.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
