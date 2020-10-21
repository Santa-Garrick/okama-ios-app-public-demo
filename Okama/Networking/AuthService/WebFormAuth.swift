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
   
	private var headers: [String: String] {
      return ["content-type": "application/x-www-form-urlencoded"]
   }
   
   private var email: String = ""
   private var password: String = ""
   private var csrfToken: String?
   
   private var signInURL: URL? {
      let urlString = "https://okama.io/user/sign-in"
      return URL(string: urlString)
   }
   private var registerURL: URL? {
      let urlString = "https://okama.io/user/register"
      return URL(string: urlString)
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
                                 password: String) -> Data? {
      let dict: [String: Any]  = [
         "email": email,
         "password": password,
         "csrf_token": csrfToken ?? "",
         "next": "/",
         "reg_next": "/",
         "invite_token": "",
         "retype_password": password
      ]
      return dict.percentEncoded()
   }
   
   
   
   func signIn(email: String,
               password: String,
               completion: @escaping (Result<Void, AuthError>) -> Void) {
      
      self.email = email
      self.password = password
      
      let task = session.dataTask(with: signInURL!) { [weak self] (data, response, error) in
         
         guard let self = self else {
				completion(.failure(AuthError.unknownError))
				return
			}
						
			if let data = data {
            let htmlString = String(data: data, encoding: .utf8)
                      				
            let parseFromString = "id=\"csrf_token\" name=\"csrf_token\" type=\"hidden\" value=\""
            guard
               let token = htmlString?.slices(from: parseFromString,
                                              to: "\"").first
               else {
						completion(.failure(AuthError.webFormError))
						return
				}

            self.csrfToken = String(token)
            self.signIn(completion: completion)
			} else {
				completion(.failure(AuthError.networkError))
			}
      }
      task.resume()
      
   }
   
   private func signIn(completion: @escaping (Result<Void, AuthError>) -> Void) {

      var request = URLRequest(url: signInURL!)
      request.httpMethod = "POST"
      request.allHTTPHeaderFields = self.headers
      request.httpBody = self.signInHTTPBody(email: email, password: password)
      
      let task = session.dataTask(with: request) { (_, _, error) in
			if error == nil {
				completion(.success(()))
			} else {
				completion(.failure(AuthError.networkError))
			}
      }
      task.resume()
   }
   
   func signOut(completion: @escaping () -> Void) {
        
        let urlString = "https://okama.io/user/sign-out"
        
        guard
           let url = URL(string: urlString)
           else { fatalError("Wrong url string") }
        
        let task = session.dataTask(with: url) { (_, _, error) in
           completion()
        }
        task.resume()
        
     }
   
   func register(withEmail email: String,
                 password: String,
                 completion: @escaping (Result<Void, AuthError>) -> Void) {
            
      self.email = email
      self.password = password
      
      let task = session.dataTask(with: registerURL!) { [weak self] (data, response, error) in
         
         guard let self = self else { return }
			
			if let data = data {
            let htmlString = String(data: data, encoding: .utf8)
                      				
            let parseFromString = "id=\"csrf_token\" name=\"csrf_token\" type=\"hidden\" value=\""
            guard
               let token = htmlString?.slices(from: parseFromString,
                                              to: "\"").first
               else {
						completion(.failure(AuthError.webFormError))
						return
				}

            self.csrfToken = String(token)
            self.register(completion: completion)
			} else {
				completion(.failure(AuthError.networkError))
			}
      }
      task.resume()
   }
   private func register(completion: @escaping (Result<Void, AuthError>) -> Void) {
      var request = URLRequest(url: registerURL!)
      request.httpMethod = "POST"
      request.allHTTPHeaderFields = self.headers
      request.httpBody = self.registerHTTPBody(email: email,
                                               password: password)
      let task = session.dataTask(with: request) { (_, _, error) in
			if error == nil {
				completion(.success(()))
			} else {
				completion(.failure(AuthError.networkError))
			}
      }
      task.resume()
   }
   
}
