//
//  MainTabBarController.swift
//  Okama
//
//  Created by Pro13 on 23.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
   
   var constructorVC: UIViewController!
   var myPortfoliosVC: PortfolioListViewController!
   var lazyPortfoliosVC: PortfolioListViewController!
   var inflationVC: InflationContainerViewController!
   var glossaryVC: GlossaryViewController!
   var authVC: AuthViewController!
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      view.backgroundColor = .white
      
      delegate = self
      
      viewControllers = [
         
         UINavigationController(withRootVC: constructorVC,
                                image: UIImage(systemName: "hammer"),
                                title: K.Title.constructor),
         UINavigationController(withRootVC: authVC,
                                image: UIImage(systemName: "person"),
                                title: K.Title.myPortfolios),
         UINavigationController(withRootVC: lazyPortfoliosVC,
                                image: UIImage(systemName: "briefcase"),
                                title: K.Title.lazyPortfolios),
         UINavigationController(withRootVC: inflationVC,
                                image: UIImage(systemName: "chart.bar"),
                                title: K.Title.inflation),
         UINavigationController(withRootVC: glossaryVC,
                                image: UIImage(systemName: "book"),
                                title: K.Title.glossary)
      ]
   }
   
}

// MARK: - UITabBarControllerDelegate methods

extension MainTabBarController: UITabBarControllerDelegate {
   func tabBarController(_ tabBarController: UITabBarController,
                         shouldSelect viewController: UIViewController) -> Bool {
      let selectedIndex = tabBarController.selectedIndex
      guard let shouldSelectIndex = viewControllers?.indexes(of: viewController).first else { return false }
      
      // do nothing if user tapped on already selected tab
      return selectedIndex != shouldSelectIndex
   }
   
}
// MARK: - AuthStatusListener methods

extension MainTabBarController: AuthStatusListener {
   
   func getAuthorized(with user: OkamaUser) {
      // creating portfolio list vc instead of AuthVC
      let navVC = UINavigationController(withRootVC: myPortfoliosVC,
                                         image: UIImage(systemName: "person"),
                                         title: K.Title.myPortfolios)
      viewControllers?[1] = navVC
   }
   func getLogOut() {
      // creating AuthVC instead of portfolio list vc
      viewControllers?[1] = UINavigationController(withRootVC: authVC,
                                                   image: UIImage(systemName: "person"),
                                                   title: K.Title.myPortfolios)
   }
}
