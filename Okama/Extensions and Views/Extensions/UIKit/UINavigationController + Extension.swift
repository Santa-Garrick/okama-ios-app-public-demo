//
//  UINavigationController + Extension.swift
//  Okama
//
//  Created by Pro13 on 28.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

extension UINavigationController {
   convenience init(withRootVC rootVC: UIViewController,
                    image: UIImage?,
                    title: String,
                    rightButton: UIBarButtonItem? = nil,
                    leftButton: UIBarButtonItem? = nil) {
      self.init(rootViewController: rootVC)
      tabBarItem.title = title
      tabBarItem.image = image
      rootVC.navigationItem.rightBarButtonItem = rightButton
      rootVC.navigationItem.leftBarButtonItem = leftButton
      rootVC.navigationItem.title = title
   }
}
