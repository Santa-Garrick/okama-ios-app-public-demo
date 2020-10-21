//
//  UIColor + Extension.swift
//  ChatTutorial
//
//  Created by Pro13 on 22.03.2020.
//  Copyright © 2020 NIcholasK. All rights reserved.
//

import UIKit

extension UIColor {
	static let buttonRed: UIColor = {
		return #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1)
	}()
	static let buttonDark: UIColor = {
		return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
	}()
	
	static let textFieldLineColor: UIColor = {
		return #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
	}()
   
   static var mainText: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.08446612209, green: 0.08446612209, blue: 0.08446612209, alpha: 1), dark: #colorLiteral(red: 0.9090331197, green: 0.9090331197, blue: 0.9090331197, alpha: 1))
   }
   static var secondaryText: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.4045292735, green: 0.4045292735, blue: 0.4045292735, alpha: 1), dark: #colorLiteral(red: 0.7200072408, green: 0.7200072408, blue: 0.7200072408, alpha: 1))
   }
   
   static var absoluteBackground: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.9527159929, green: 0.9527159929, blue: 0.9527159929, alpha: 1), dark: #colorLiteral(red: 0.04237588122, green: 0.04237588122, blue: 0.04237588122, alpha: 1))
   }
   
   static var chartViewGoldHighlight: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.6923153697, green: 0.5806259598, blue: 0.2971328557, alpha: 1), dark: #colorLiteral(red: 0.6923153697, green: 0.5806259598, blue: 0.2971328557, alpha: 1))
   }
   
   static var dimViewColor: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.4045292735, green: 0.4045292735, blue: 0.4045292735, alpha: 1), dark: #colorLiteral(red: 0.08446612209, green: 0.08446612209, blue: 0.08446612209, alpha: 1))
   }
   
   static var mainBackground: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.9527159929, green: 0.9527159929, blue: 0.9527159929, alpha: 1), dark: #colorLiteral(red: 0.08446612209, green: 0.08446612209, blue: 0.08446612209, alpha: 1))
   }
   
   static var secondaryBackground: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.9010467529, green: 0.9010467529, blue: 0.9010467529, alpha: 1), dark: #colorLiteral(red: 0.1456105858, green: 0.1456105858, blue: 0.1456105858, alpha: 1))
   }
   
   static var fillBlue: UIColor {
      return compositeColor(light: #colorLiteral(red: 0, green: 0.4247419523, blue: 0.6396332577, alpha: 1), dark: #colorLiteral(red: 0, green: 0.3728638415, blue: 0.5615082577, alpha: 1))
   }
   static var buttonBlue: UIColor {
      return compositeColor(light: #colorLiteral(red: 0, green: 0.4247419523, blue: 0.6396332577, alpha: 1), dark: #colorLiteral(red: 0, green: 0.3555666579, blue: 0.5354598445, alpha: 1))
   }
   static var barButtonBlue: UIColor {
      return compositeColor(light: #colorLiteral(red: 0, green: 0.4247419523, blue: 0.6396332577, alpha: 1), dark: #colorLiteral(red: 0, green: 0.4522131592, blue: 0.6810030764, alpha: 1))
   }
   
   static var fillGreen: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.2562662967, green: 0.5323834197, blue: 0.3857377183, alpha: 1), dark:  #colorLiteral(red: 0.2224495497, green: 0.5487572863, blue: 0.3726255737, alpha: 1))
   }
   
   static var tabBarSelected: UIColor {
      return compositeColor(light: #colorLiteral(red: 0.0770246461, green: 0.0770246461, blue: 0.0770246461, alpha: 1), dark: #colorLiteral(red: 0.9168155789, green: 0.9168155789, blue: 0.9168155789, alpha: 1))
   }
   
   static func compositeColor(light: UIColor, dark: UIColor) -> UIColor {
      if #available(iOS 13, *) {
         return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
               return dark
            } else {
               return light
            }
         }
      } else {
         return light
      }
   }
}
