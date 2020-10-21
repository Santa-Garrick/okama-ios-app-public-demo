//
//  WebFormAuth.swift
//  Okama
//
//  Created by Pro13 on 04.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class WebFormAuth {
   
   static let shared = WebFormAuth()
   private init() {}
   
   private let session = URLSession(configuration: URLSessionConfiguration.default)
   
   var csrfToken: String?
   
   private var signInURL: URL? {
      let urlString = "https://okama.io/user/sign-in"
      guard let url = URL(string: urlString) else { return nil }
      return url
   }
   
   private var registerURL: URL? {
      let urlString = "https://okama.io/user/register"
      guard let url = URL(string: urlString) else { return nil }
      return url
   }
   
   private func signInHTTPBody(email: String,
                               password: String) -> Data? {
      let dict: [String: Any]  = [
         "email": email,
         "password": password,
         "csrf_token": csrfToken ?? "",
         "next": "/",
         "reg_next": "/"
      ]
      return dict.percentEncoded()
   }
   private func registerHTTPBody(email: String,
                                 password: String,
                                 confirm: String) -> Data? {
      let dict: [String: Any]  = [
         "email": email,
         "password": password,
         "csrf_token": csrfToken ?? "",
         "next": "/",
         "reg_next": "/",
         "invite_token": "",
         "retype_password": confirm
      ]
      return dict.percentEncoded()
   }
   
   var headers: [String: String] {
      return [
         "content-type": "application/x-www-form-urlencoded"
      ]
   }
   
   var email: String = ""
   var password: String = ""
   
   func signIn(email: String,
               password: String,
               completion: @escaping () -> Void) {
      
      self.email = email
      self.password = password
      print("\n\n\n\n")
      print("initial collecting")
      
      let task = session.dataTask(with: signInURL!) { [weak self] (data, response, error) in
         
         guard let self = self else { return }
         
         if let response = response {
            print ("response: ")

            print (response)
         }
         if let data = data {
            let htmlString = String(data: data, encoding: .utf8)
                        
            let parseFromString = "id=\"csrf_token\" name=\"csrf_token\" type=\"hidden\" value=\""
            guard
               let token = htmlString?.slices(from: parseFromString,
                                              to: "\"").first
               else { fatalError("parsing html failed") }
            
            print("html data:")
            print(htmlString)
            
            
            self.csrfToken = String(token)
            
            print("\n\n\n\n")
            print(self.csrfToken)
            print("initial collecting success")
            self.signIn(completion: completion)
         }
         if let error = error {
            print()
            print("error found in webFormAuth")
            print(error)
         }
      }
      task.resume()
      
   }
   
   private func signIn(completion: @escaping () -> Void) {
      
      print("\n\n\n\n")
      print("login start")
      
      print(email)
      
      var request = URLRequest(url: signInURL!)
      request.httpMethod = "POST"
      request.allHTTPHeaderFields = self.headers
      request.httpBody = self.signInHTTPBody(email: email, password: password)
      
      let task = session.dataTask(with: request) { (data, response, error) in
         if let data = data {
            let htmlString = String(data: data, encoding: .utf8)
            
            print("html data:")
            print(htmlString)
            

            
         }
         
         
         if let response = response {
            print ("response: ")

            print (response)
         }
         if let error = error {
            print("error during login")
            print(error)
         }
         completion()
      }
      
      task.resume()
      print("\n\n\n\n")
      print("login finished")
   }
   
   func signOut(completion: @escaping () -> Void) {
        
        let urlString = "https://okama.io/user/sign-out"
        
        guard
           let url = URL(string: urlString)
           else { fatalError("Wrong url string") }
        
        let task = session.dataTask(with: url) { (_, _, _) in
           completion()
        }
        task.resume()
        
     }
   
   func register(withEmail email: String,
                 password: String,
                 confirmPassword: String,
                 completion: @escaping () -> Void) {
            
      self.email = email
      self.password = password
      print("/n/n/n/n")
      print("initial collecting")

      
      let task = session.dataTask(with: registerURL!) { [weak self] (data, response, error) in
         
         guard let self = self else { return }
         
         if let response = response {
            print("response:")
            print (response)
         }
         if let data = data {
            let htmlString = String(data: data, encoding: .utf8)
            
            let parseFromString = "id=\"csrf_token\" name=\"csrf_token\" type=\"hidden\" value=\""
            guard
               let token = htmlString?.slices(from: parseFromString,
                                              to: "\"").first
               else { fatalError("parsing html failed") }
            print("html data:")
            print(htmlString)
            
            self.csrfToken = String(token)
            self.register(completion: completion)
         } else {
            print("no html")
         }
         if let error = error {
            print(error)
         }
      }
      task.resume()
   }
   func register(completion: @escaping () -> Void) {
      var request = URLRequest(url: registerURL!)
      request.httpMethod = "POST"
      request.allHTTPHeaderFields = self.headers
      request.httpBody = self.registerHTTPBody(email: email,
                                               password: password,
                                               confirm: password)
      
      let task = session.dataTask(with: request) { (_, _, error) in
         if let error = error {
            print(error)
         }
         completion()
      }
      task.resume()
   }
   
}
