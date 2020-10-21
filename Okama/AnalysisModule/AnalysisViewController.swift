//
//  AnalysisViewController.swift
//  Okama
//
//  Created by Pro13 on 07.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class AnalysisViewController: UITabBarController {
   
   var activitiesVC: UIViewController!
   var chartVC: UIViewController!
   var annualReturnsVC: UIViewController!
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      let activitiesImage = UIImage(systemName: "table")
      let chartImage = UIImage(systemName: "waveform.path.ecg")
      let annualReturnsImage = UIImage(systemName: "chart.bar")
      
      let leftButton = UIBarButtonItem(title: "Hide",
                                       style: .plain, target: self, action: #selector(hideTapped))
		
		
		
      viewControllers = [
         UINavigationController(withRootVC: activitiesVC,
                                image: activitiesImage,
                                title: "Activities",
										  leftButton: leftButton),
         UINavigationController(withRootVC: chartVC,
                                image: chartImage,
                                title: "Chart",
										  leftButton: leftButton),
         UINavigationController(withRootVC: annualReturnsVC,
                                image: annualReturnsImage,
                                title: "Annual Returns",
										  leftButton: leftButton)
         
      ]
		
   }
   
	
	
   @objc private func hideTapped() {
      dismiss(animated: true, completion: nil)
   }
   
}
