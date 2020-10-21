//
//  LayoutConditionsViewController.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

protocol ConstructorButtonsViewDelegate {
	func analyzeTapped()
	func showAnalysisTapped()
	func datePressed()
	func amountPressed()
}

class ConstructorButtonsView: UIView {
	
	var delegate: ConstructorButtonsViewDelegate?
	
	private var analyzeButton: UIButton!
   private var showAnalysisButton: UIButton!
   private var dateButton: UIButton!
   private var amountButton: UIButton!
   private var dateRangeLoader: UIActivityIndicatorView!
   private var analysisLoader: UIActivityIndicatorView!
   private var infoTextLabel: UILabel!
   private var startDateLabel: UILabel!
   private var initialAmountLabel: UILabel!
	
	var conditionButtonSize = CGSize(width: 144, height: 40)
	var analyzeButtonSize = CGSize(width: 272, height: 44)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initViews()
		
      setupActions()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func initViews() {
      let startDateText = NSLocalizedString("startDateLabel",
                                            comment: "") + ":"
      let initialAmountText = NSLocalizedString("initialAmountText",
                                                comment: "") + ":"
      let labelFont = UIFont.systemFont(ofSize: 11, weight: .light)
      
      startDateLabel = UILabel(text: startDateText,
                               font: labelFont,
                               textColor: .secondaryText,
                               numberOfLines: 0)
      initialAmountLabel = UILabel(text: initialAmountText,
                                   font: labelFont,
                                   textColor: .secondaryText,
                                   numberOfLines: 0)
      
      analyzeButton = UIButton(title: K.Constructor.analyze,
                               titleColor: .white,
                               backgroundColor: .buttonBlue,
                               font: .systemFont(ofSize: 15,
                                                 weight: .regular),
                               hasShadow: false,
                               cornerRadius: 8,
                               image: nil)
      showAnalysisButton = UIButton(title: K.Constructor.showAnalysis,
                                    titleColor: .white,
                                    backgroundColor: .buttonBlue,
                                    font: .systemFont(ofSize: 15,
                                                      weight: .regular),
                                    hasShadow: false,
                                    cornerRadius: 8,
                                    image: nil)
      
      dateButton = UIButton(title: "",
                            titleColor: .white,
                            backgroundColor: .buttonBlue,
                            font: .systemFont(ofSize: 13,
                                              weight: .regular),
                            hasShadow: false,
                            cornerRadius: 8,
                            image: nil)
      amountButton = UIButton(title: "",
                              titleColor: .white,
                              backgroundColor: .buttonBlue,
                              font: .systemFont(ofSize: 13,
                                                weight: .regular),
                              hasShadow: false,
                              cornerRadius: 8,
                              image: nil)
      dateRangeLoader = UIActivityIndicatorView(color: #colorLiteral(red: 0.8490458131, green: 0.8490458131, blue: 0.8490458131, alpha: 1),
                                                hidesWhenStopped: true)
      analysisLoader = UIActivityIndicatorView(color: #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1),
                                               hidesWhenStopped: true)
      infoTextLabel = UILabel(text: "",
                              font: UIFont.systemFont(ofSize: 14),
                              textColor: .secondaryText,
                              numberOfLines: 0,
                              textAlignment: .center)
      
		backgroundColor = UIColor.secondaryBackground
      
   }
	
	private func setupLayout() {
      
      let viewsToAdd = [
         startDateLabel,
         initialAmountLabel,
         analyzeButton,
         showAnalysisButton,
         dateButton,
         amountButton,
         infoTextLabel,
         dateRangeLoader,
         analysisLoader
      ]
      addSubviews(viewsToAdd)
      setupConstraints()
   }
   
	override func layoutSubviews() {
		super.layoutSubviews()
		setupLayout()
	}
	
   func setupConstraints() {
         
      NSLayoutConstraint.activate([
         
         startDateLabel.leadingAnchor.constraint(equalTo: dateButton.leadingAnchor,
                                                 constant: 10),
         startDateLabel.bottomAnchor.constraint(equalTo: dateButton.topAnchor,
                                                constant: -2),
         
         initialAmountLabel.leadingAnchor.constraint(equalTo: amountButton.leadingAnchor,
                                                     constant: 10),
         initialAmountLabel.bottomAnchor.constraint(equalTo: amountButton.topAnchor,
                                                    constant: -2),
         
         dateButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                             constant: 10),
         dateButton.topAnchor.constraint(equalTo: topAnchor,
                                         constant: 20),
         dateButton.heightAnchor.constraint(equalToConstant: 40),
         dateButton.widthAnchor.constraint(equalToConstant: frame.size
            .width * 0.45),
         
         dateRangeLoader.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: 10),
         dateRangeLoader.topAnchor.constraint(equalTo: topAnchor,
                                              constant: 20),
         dateRangeLoader.heightAnchor.constraint(equalToConstant: 40),
         dateRangeLoader.widthAnchor.constraint(equalToConstant: frame.size
            .width * 0.45),
         
         amountButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                constant: -10),
         amountButton.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 19),
         amountButton.heightAnchor.constraint(equalToConstant: 40),
         amountButton.widthAnchor.constraint(equalToConstant: frame.size
            .width * 0.45),
         
         analyzeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
         analyzeButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -5),
         analyzeButton.heightAnchor.constraint(equalToConstant: 44),
         analyzeButton.widthAnchor.constraint(equalToConstant: frame.size
            .width * 0.85),
         
         showAnalysisButton.centerXAnchor.constraint(equalTo: centerXAnchor),
         showAnalysisButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                    constant: -5),
         showAnalysisButton.heightAnchor.constraint(equalToConstant: 44),
         showAnalysisButton.widthAnchor.constraint(equalToConstant: frame.size
            .width * 0.85),
         
         infoTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
         infoTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -18),
         
         analysisLoader.trailingAnchor.constraint(equalTo: infoTextLabel.leadingAnchor,
                                                  constant: -8),
         analysisLoader.centerYAnchor.constraint(equalTo: infoTextLabel.centerYAnchor),
         analysisLoader.heightAnchor.constraint(equalToConstant: 44)
         
      ])
      
     
   }

   private func setupActions() {
      analyzeButton.addTarget(self,
                              action: #selector(analyzeTapped),
                              for: .touchUpInside)
      showAnalysisButton.addTarget(self,
                                   action: #selector(showAnalysisTapped),
                                   for: .touchUpInside)
      dateButton.addTarget(self,
                           action: #selector(datePressed),
                           for: .touchUpInside)
      amountButton.addTarget(self,
                             action: #selector(amountPressed),
                             for: .touchUpInside)
      
   }
	//
	
	
	func showConditionsButtons() {
      dateButton.isHidden = false
      amountButton.isHidden = false
      startDateLabel.isHidden = false
      initialAmountLabel.isHidden = false
   }
   func hideConditionsButtons() {
      dateButton.isHidden = true
      amountButton.isHidden = true
      startDateLabel.isHidden = true
      initialAmountLabel.isHidden = true
   }
   func showAnalyzeButton() {
      analyzeButton.isHidden = false
   }
   func hideAnalyzeButton() {
      analyzeButton.isHidden = true
   }
   
   func showShowAnalysisButton() {
      showAnalysisButton.isHidden = false
   }
   
   func hideShowAnalysisButton() {
      showAnalysisButton.isHidden = true
   }
   
   
   func showLoadingDates() {
      dateRangeLoader.startAnimating()
      dateButton.isEnabled = false
      dateButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
   }

      
   func hideLoadingDates() {
      dateRangeLoader.stopAnimating()
      dateButton.isEnabled = true
      dateButton.setTitleColor(.white, for: .normal)
   }

      
   func showLoadingAnalysis() {
      analysisLoader.startAnimating()
   }

   func hideLoadingAnalysis() {
      analysisLoader.stopAnimating()

   }
	
	//
	
	@objc func analyzeTapped() {
		delegate?.analyzeTapped()
	}
   @objc func showAnalysisTapped() {
		delegate?.showAnalysisTapped()
   }
   @objc func datePressed() {
		delegate?.datePressed()
	}
   @objc func amountPressed() {
		delegate?.amountPressed()
	}
	
}

extension ConstructorButtonsView: ConditionsDisplaying {
   func display(date: String) {
      dateButton.setTitle(date, for: .normal)
   }
   
   func display(amount: String, currency: Currency) {
      amountButton.setTitle(currency.title + amount, for: .normal)
   }
   
   
   private func set(message: String) {
      infoTextLabel.text = message
   }
   
   func setUI(_ state: UIState) {
      switch state {
      
      case .noAssets:
         hideAnalyzeButton()
         hideShowAnalysisButton()
         hideConditionsButtons()
         hideLoadingDates()
         set(message: K.Message.addAtLeastOne)
      case .dateRangeLoading:
         hideAnalyzeButton()
         hideShowAnalysisButton()
         showLoadingDates()
         showConditionsButtons()
         set(message: K.Message.loadingAvailableDates)
		case .noAvailableDates:
			hideAnalyzeButton()
         hideShowAnalysisButton()
         hideConditionsButtons()
         hideLoadingDates()
         set(message: K.Message.loadingAvailableDates)
      case .readyToAnalyze:
         showConditionsButtons()
         hideLoadingDates()
         showAnalyzeButton()
         hideShowAnalysisButton()
         set(message: "")
         hideLoadingAnalysis()
      case .analyzing:
         hideAnalyzeButton()
         set(message: K.Message.loadingAnalysis)
         showLoadingAnalysis()
      case .analysisIsReady:
         showShowAnalysisButton()
         hideAnalyzeButton()
         set(message: "")
         hideLoadingAnalysis()
      }		
   }
   
}



extension UIView {
   func addSubviews(_ views: [UIView?],
                    tamic: Bool = false) {
      _ = views
         .compactMap { $0 }
         .map {
         self.addSubview($0)
         $0.translatesAutoresizingMaskIntoConstraints = tamic
      }
   }
}
