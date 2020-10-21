//
//  ViewControllerWithLoader.swift
//  Okama
//
//  Created by Pro13 on 10.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


class ViewControllerWithLoadingView: UIViewController {
   private var loadingView = LoadingView(backgroundColor: .secondaryBackground,
                                 indicatorColor: nil,
                                 cornerRadius: 12,
                                 textColor: .secondaryText,
                                 font: .systemFont(ofSize: 12,
                                                   weight: .regular))
   private var dimView = UIView()
   override func viewDidAppear(_ animated: Bool)  {
      super.viewDidAppear(animated)
      view.addSubview(dimView)
      view.addSubview(loadingView)
      loadingView.translatesAutoresizingMaskIntoConstraints = false
      dimView.translatesAutoresizingMaskIntoConstraints = false
      dimView.backgroundColor = .mainBackground
      dimView.alpha = 0.8
      dimView.isHidden = true
      NSLayoutConstraint.activate([
         dimView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         dimView.topAnchor.constraint(equalTo: view.topAnchor),
         dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         
         loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         loadingView.heightAnchor.constraint(equalToConstant: 120),
         loadingView.widthAnchor.constraint(equalToConstant: 120)

      ])
   }
   func startLoadingAnimation(with text: String = "") {
      dimView.isHidden = false
      loadingView.startAnimating(withText: text)
   }
   func stopLoadingAnimation() {
      dimView.isHidden = true
      loadingView.stopAnimating()
   }
}
