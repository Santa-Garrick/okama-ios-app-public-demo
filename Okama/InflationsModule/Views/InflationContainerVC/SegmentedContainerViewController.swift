//
//  SegmentedContainerViewController.swift
//  Okama
//
//  Created by Pro13 on 15.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class SegmentedContainerViewController: UIViewController {
   
   var viewControllers: [UIViewController] = []
   private var segmentedControl: UISegmentedControl!
   var segmentedHeight: CGFloat = 42
   let titleLabel = UILabel(text: "", font: .systemFont(ofSize: 18, weight: .bold), textColor: .mainText, numberOfLines: 0, textAlignment: .center)
   
   var selectedVC: UIViewController {
      return viewControllers[segmentedControl.selectedSegmentIndex]
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      setupSegmentedControl()
      
      segmentedControl.selectedSegmentIndex = 0
      updateView()
   }
   
   private func setupSegmentedControl() {
      let items = viewControllers.map { $0.title ?? "" }
      if items.isEmpty { fatalError("Should have at least one viewcontroller") }
      
      segmentedControl = UISegmentedControl(items: items)
      
      navigationItem.titleView = segmentedControl
      
      segmentedControl.addTarget(self, action: #selector(segmentedControlHandler), for: .valueChanged)
   }
   
   @objc private func segmentedControlHandler(_ sender: UISegmentedControl) {
      updateView()
      didSelectNewVC()
   }
   
   func didSelectNewVC() {
      
   }
   
   private func updateView() {
      if let oldVC = children.first {
         remove(asChildViewController: oldVC)
      }
      let newVC = viewControllers[segmentedControl.selectedSegmentIndex]
      add(asChildViewController: newVC)
   }
}


// MARK: - Add and Remove methods

extension SegmentedContainerViewController {
   private func add(asChildViewController viewController: UIViewController) {
      // Add Child View Controller
      addChild(viewController)
      
      // Add Child View as Subview
      view.addSubview(viewController.view)
      
      // Configure Child View
      viewController.view.frame = view.bounds
      viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      
      // Notify Child View Controller
      viewController.didMove(toParent: self)
   }
   
   private func remove(asChildViewController viewController: UIViewController) {
      // Notify Child View Controller
      viewController.willMove(toParent: nil)
      
      // Remove Child View From Superview
      viewController.view.removeFromSuperview()
      
      // Notify Child View Controller
      viewController.removeFromParent()
   }
   
}
