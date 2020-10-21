//
//  EditValueViewController.swift
//  Okama
//
//  Created by Pro13 on 24.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class EditAmountViewController: UIViewController {

   var presenter: ConstructorPresenting!
   
// MARK: - UI Elements
   let textField = UITextField()
   let currencyPicker = UIPickerView()
   
// MARK: - Values
   var amount: Double!
   var currency: Currency!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .secondaryBackground
      
		amount = presenter.initialAmount
		currency = presenter.currency
      configureTextField()
      configurePicker()
      setupLayout()
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      textField.selectAll(nil)
   }
   
   @objc func textFieldDidChangeValue() {
      guard let text = textField.text else { return }
      guard !text.isEmpty, let value = Double(text) else { return }
      amount = value
      presenter.setAmount(amount)
   }
   
// MARK: - Setup UI
   private func configureTextField() {
      textField.keyboardType = .decimalPad
      textField.text = amount.roundedString
      textField.textColor = .mainText
      textField.borderWidth = 1
      
      textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
      textField.backgroundColor = .mainBackground
      textField.addTarget(self,
                          action: #selector(textFieldDidChangeValue),
                          for: .editingChanged)
      textField.textAlignment = .right
      textField.becomeFirstResponder()
      
      textField.setLeftPaddingPoints(8)
      textField.setRightPaddingPoints(8)
   }
   
   private func configurePicker() {
      currencyPicker.dataSource = self
      currencyPicker.delegate = self
      currencyPicker.selectRow(currency.caseIndex,
                               inComponent: 0,
                               animated: false)
   }
   
   private func setupLayout() {
      view.addSubview(currencyPicker)
      view.addSubview(textField)
      
      currencyPicker.translatesAutoresizingMaskIntoConstraints = false
      textField.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                            constant: 10),
         textField.trailingAnchor.constraint(equalTo: currencyPicker.leadingAnchor,
                                             constant: -8),
         textField.widthAnchor.constraint(equalToConstant: 150),
         textField.heightAnchor.constraint(equalToConstant: 32),
         
         currencyPicker.topAnchor.constraint(equalTo: view.topAnchor,
                                             constant: 10),
         currencyPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -10),
         currencyPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                constant: -10),
         currencyPicker.widthAnchor.constraint(equalToConstant: 80)
      ])

      textField.layer.cornerRadius = 8
   }
   
}

// MARK: - Picker datasource & delegate

extension EditAmountViewController: UIPickerViewDataSource, UIPickerViewDelegate {
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
   }
   
   func pickerView(_ pickerView: UIPickerView,
                   numberOfRowsInComponent component: Int) -> Int {
      
      return Currency.allCases.count
   }
   
   func pickerView(_ pickerView: UIPickerView,
                   titleForRow row: Int,
                   forComponent component: Int) -> String? {
      Currency(fromCaseIndex: row)?.title
   }
   func pickerView(_ pickerView: UIPickerView,
                   didSelectRow row: Int, inComponent component: Int) {
      currency = Currency(fromCaseIndex: row)!
      presenter.setCurrency(currency)
   }
}
