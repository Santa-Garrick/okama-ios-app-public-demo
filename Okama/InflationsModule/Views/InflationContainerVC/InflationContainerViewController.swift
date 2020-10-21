//
//  InflationViewController.swift
//  Okama
//
//  Created by Pro13 on 08.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts


class InflationContainerViewController: SegmentedContainerViewController {
   
   // dependency
   var presenter: InflationPresenterProtocol!
   // children
   var monthsVC: (CurrencyView & UIViewController)!
   var yoyVC: (CurrencyView & UIViewController)!
   var valuesVC: (CurrencyView & UIViewController)!
   
   private var currencySegmentedControl: UISegmentedControl!
   
   var selectedCurrency: Currency {
      let index = currencySegmentedControl.selectedSegmentIndex
      let currency = Currency(fromCaseIndex: index)
      return currency!
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      moveTabBarDuringOrientationChange()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      monthsVC.title = "Months"
      yoyVC.title = "YoY"
      valuesVC.title = "Values"
      
      viewControllers = [
         monthsVC,
         yoyVC,
         valuesVC
      ]
      
      setupCurrencySegmentedControl()
      setupCurrencyButton(withFontSize: 20)
      
      currencySegmentedControl.selectedSegmentIndex = 0
      hideCurrencySegmented()
      
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      presenter.requestInflation(for: selectedCurrency)
   }
   
   private func setupCurrencyButton(withFontSize fontSize: CGFloat) {
      let currencyButton = UIBarButtonItem(title: Currency.rub.title,
                                           style: .plain,
                                           target: self,
                                           action: #selector(currencyTapped))
      currencyButton.set(fontSize: fontSize)
      navigationItem.rightBarButtonItem = currencyButton
   }
   
   private func setupCurrencySegmentedControl() {
      
      currencySegmentedControl = UISegmentedControl(items: Currency.allCases.map { $0.title })

      let currencyAction = #selector(handleCurrencyValueChanged(_:))
      currencySegmentedControl.addTarget(self,
                                         action: currencyAction,
                                         for: .valueChanged)
      currencySegmentedControl.addTarget(self,
                                         action: currencyAction,
                                         for: .touchUpInside)
      
      view.addSubview(currencySegmentedControl)
      currencySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
      
      let margins = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
         currencySegmentedControl.topAnchor.constraint(equalTo: margins.topAnchor),
         currencySegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         currencySegmentedControl.heightAnchor.constraint(equalToConstant: segmentedHeight),
         currencySegmentedControl.widthAnchor.constraint(equalToConstant: 170)
      ])
      
   }
   
   @objc private func currencyTapped() {
      print(#function)
      if currencySegmentedControl.isHidden {
         showCurrencySegmented()
      } else {
         hideCurrencySegmented()
      }
      
   }
   
   private func showCurrencySegmented() {
      print(#function)
      view.bringSubviewToFront(currencySegmentedControl)
      UIView.animate(withDuration: 0.1, animations: {
         self.currencySegmentedControl.alpha = 1
         
      }, completion: { _ in
         self.currencySegmentedControl.isHidden = false
      })
   }
   
   private func hideCurrencySegmented(with delay: TimeInterval = 0) {
      UIView.animate(withDuration: 0.4, animations: {
         self.currencySegmentedControl.alpha = 0
      }, completion: { _ in
         self.currencySegmentedControl.isHidden = true
      })
   }
   
   @objc private func handleCurrencyValueChanged(_ sender: UISegmentedControl) {
      print(#function)

      guard let currency = Currency(fromCaseIndex: sender.selectedSegmentIndex) else {
         return
      }
      
      hideCurrencySegmented(with: 0.1)
      navigationItem.rightBarButtonItem?.title = currency.title
      
      presenter.requestInflation(for: selectedCurrency)
   }
   
}

extension InflationContainerViewController: CurrencyView {
   func showLoader() {
      _ = viewControllers.map({ ($0 as! CurrencyView).showLoader() })
   }
   
   func showData(inflation: Inflation) {
      if inflation.currency == selectedCurrency {
         _ = viewControllers.map({ ($0 as! CurrencyView).showData(inflation: inflation) })
      }
      hideCurrencySegmented()
   }
}
