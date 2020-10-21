//
//  DescriptionViewController.swift
//  Okama
//
//  Created by Pro13 on 26.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import WebKit

class DescriptionViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
   
   var term: Term!
   var completion: ((URL?) -> Void)!
   
   var webView: WKWebView!
   
   var loadingIndicator: UIActivityIndicatorView!
   
   private func configureWebView() {
      let webConfiguration = WKWebViewConfiguration()
      webView = WKWebView(frame: .zero,
                          configuration: webConfiguration)
      
      webView.uiDelegate = self
      webView.navigationDelegate = self
      
      webView.frame = view.frame
      view.addSubview(webView)
      webView.isHidden = true
   }
   
   private func populateWebView() {
      let myURL = URL(string: term.url!)
      let myRequest = URLRequest(url: myURL!)
      webView.load(myRequest)
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      startLoadingAnimation()
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      configureWebView()
      populateWebView()
   }

   func webView(_ webView: WKWebView,
                decidePolicyFor navigationAction: WKNavigationAction,
                decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      
      if navigationAction.navigationType == .linkActivated {
         completion(navigationAction.request.url)
         
         decisionHandler(WKNavigationActionPolicy.cancel)
         return
      }
      decisionHandler(WKNavigationActionPolicy.allow)
   }
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      print(#function)
      // waiting UI
      stopLoadingAnimation()
   }
   private func startLoadingAnimation() {
      loadingIndicator = UIActivityIndicatorView()
      view.addSubview(loadingIndicator)
      loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         loadingIndicator.heightAnchor.constraint(equalToConstant: 80),
         loadingIndicator.widthAnchor.constraint(equalToConstant: 80),
         loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
      loadingIndicator.startAnimating()
   }
   private func stopLoadingAnimation() {
      loadingIndicator.stopAnimating()
      loadingIndicator.isHidden = true
      webView.isHidden = false
   }
}

