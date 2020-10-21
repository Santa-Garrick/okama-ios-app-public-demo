//
//  UIApplication + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 28.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIApplication {
	var rootViewController: UIViewController? {
		set {
			let keyWindow = UIApplication.shared.connectedScenes
				.filter({$0.activationState == .foregroundActive})
				.map({$0 as? UIWindowScene})
				.compactMap({$0})
				.first?.windows
				.filter({$0.isKeyWindow}).first
			keyWindow?.rootViewController = newValue
		}
		get {
			let keyWindow = UIApplication.shared.connectedScenes
				.filter({$0.activationState == .foregroundActive})
				.map({$0 as? UIWindowScene})
				.compactMap({$0})
				.first?.windows
				.filter({$0.isKeyWindow}).first
			return keyWindow?.rootViewController
		}
	}
	
	func getTopViewController(base: UIViewController? = UIApplication.shared.rootViewController) -> UIViewController? {
		
		if let nav = base as? UINavigationController {
			return getTopViewController(base: nav.visibleViewController)
			
		} else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
			return getTopViewController(base: selected)
			
		} else if let presented = base?.presentedViewController {
			return getTopViewController(base: presented)
		}
		return base
	}
}

