//
//  PerformanceView.swift
//  Okama
//
//  Created by Pro13 on 08.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit



class PerformanceView: UIView {
   
   // value name labels
   private var startDateLabel = UILabel(text: "Start date:",
                                        font: .systemFont(ofSize: 13,
                                                          weight: .light),
                                        textColor: .mainText)
   private var ytdLabel = UILabel(text: "YTD Return:",
                                  font: .systemFont(ofSize: 13,
                                                    weight: .light),
                                  textColor: .mainText)
   private var standardDeviationLabel = UILabel(text: "Standart deviation:",
                                                font: .systemFont(ofSize: 13,
                                                                  weight: .light),
                                                textColor: .mainText)
   private var currencyLabel = UILabel(text: "Currency:",
                                       font: .systemFont(ofSize: 13,
                                                         weight: .light),
                                       textColor: .mainText)
   // value labels
   private var startDateValueLabel = UILabel(text: "",
                                             font: .systemFont(ofSize: 15,
                                                               weight: .regular),
                                             textColor: .mainText)
   private var ytdValueLabel = UILabel(text: "",
                                       font: .systemFont(ofSize: 15,
                                                         weight: .regular),
                                       textColor: .mainText)
   private var standardDeviationValueLabel = UILabel(text: "",
                                                     font: .systemFont(ofSize: 15,
                                                                       weight: .regular),
                                                     textColor: .mainText)
   private var currencyValueLabel = UILabel(text: "",
                                            font: .systemFont(ofSize: 15,
                                                              weight: .regular),
                                            textColor: .mainText)
   
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupConstraints()
      backgroundColor = .clear
   }

   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func configureWith(startDate: Date,
                     currency: Currency,
                     performance: Portfolio.BasicAnalysis) {
   
      startDateValueLabel.text = startDate.uiString
      currencyValueLabel.text = currency.title
      ytdValueLabel.text = performance.ytdReturn.percentageString
      standardDeviationValueLabel.text = performance.standartDeviation.percentageString
   }
   
   func setupConstraints() {
      
      addSubview(startDateLabel)
      addSubview(ytdLabel)
      addSubview(standardDeviationLabel)
      addSubview(currencyLabel)

      addSubview(startDateValueLabel)
      addSubview(ytdValueLabel)
      addSubview(standardDeviationValueLabel)
      addSubview(currencyValueLabel)
      
      startDateLabel.translatesAutoresizingMaskIntoConstraints = false
      ytdLabel.translatesAutoresizingMaskIntoConstraints = false
      standardDeviationLabel.translatesAutoresizingMaskIntoConstraints = false
      currencyLabel.translatesAutoresizingMaskIntoConstraints = false
      
      startDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
      ytdValueLabel.translatesAutoresizingMaskIntoConstraints = false
      standardDeviationValueLabel.translatesAutoresizingMaskIntoConstraints = false
      currencyValueLabel.translatesAutoresizingMaskIntoConstraints = false
      

      let constraints = [
         
         startDateValueLabel.topAnchor.constraint(equalTo: topAnchor,
                                                  constant: 4),
         startDateValueLabel.leadingAnchor.constraint(equalTo: centerXAnchor,
                                                      constant: 4),
         ytdValueLabel.topAnchor
            .constraint(equalTo: startDateValueLabel.bottomAnchor,
                        constant: 4),
         ytdValueLabel.leadingAnchor.constraint(equalTo: centerXAnchor,
                                                constant: 4),
         standardDeviationValueLabel.topAnchor
            .constraint(equalTo: ytdValueLabel.bottomAnchor,
                        constant: 4),
         standardDeviationValueLabel.leadingAnchor
            .constraint(equalTo: centerXAnchor,
                        constant: 4),
         currencyValueLabel.topAnchor
            .constraint(equalTo: standardDeviationValueLabel.bottomAnchor,
                        constant: 4),
         currencyValueLabel.leadingAnchor
            .constraint(equalTo: centerXAnchor,
                        constant: 4),
         
         //
         
         startDateLabel.bottomAnchor
            .constraint(equalTo: startDateValueLabel.bottomAnchor),
         startDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                 constant: 4),
         
         ytdLabel.bottomAnchor
            .constraint(equalTo: ytdValueLabel.bottomAnchor),
         ytdLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: 4),
         
         standardDeviationLabel.bottomAnchor
            .constraint(equalTo: standardDeviationValueLabel.bottomAnchor),
         standardDeviationLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: 4),
         
         currencyLabel.bottomAnchor
            .constraint(equalTo: currencyValueLabel.bottomAnchor),
         currencyLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 4)

      ]
      
      _ = constraints.map { $0.priority = UILayoutPriority(999) }
      
      NSLayoutConstraint.activate(constraints)
   }
}

