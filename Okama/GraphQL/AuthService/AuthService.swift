//
//  AuthService.swift
//  Okama
//
//  Created by Pro13 on 28.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit


public protocol AuthStatusPublisher: class {
   func addListener(_ listener: AuthStatusListener)
   func removeListener(_ listener: AuthStatusListener)
   func notify()
}

public protocol AuthStatusListener: class {
   func getAuthorized(with user: OkamaUser)
   func getLogOut()
}

public protocol AuthServiceProtocol {
   func login(withEmail email: String?,
              password: String?,
              completion: @escaping (Result<OkamaUser, Error>) -> Void)
   func register(withEmail email: String?,
                 password: String?,
                 confirmPassword: String?,
                 completion: @escaping (Result<OkamaUser, Error>) -> Void)
   func logout(completion: @escaping () -> Void)
   
}

public class OkamaFlaskAuthService: AuthServiceProtocol {
   
   static let shared = OkamaFlaskAuthService()
   private init() {}
   
   private var listeners: [AuthStatusListener] = []
   private let auth = WebFormAuth.shared
   private let networking: AuthStatusCheckerProtocol = AuthStatusChecker()
   
   var user: OkamaUser?
   
   public func login(withEmail email: String?,
              password: String?,
              completion: @escaping (Result<OkamaUser, Error>) -> Void) {
      
      guard let email = email, !email.isEmpty, email.isValidEmail else {
         completion(.failure(AuthError.invalidEmail))
         return
      }
      guard let password = password, !password.isEmpty else {
         completion(.failure(AuthError.notFilled))
         return
      }
      
      auth.signIn(email: email,
                  password: password) { [weak self] in
      
                     guard let self = self else { return }
                     
                     self.networking.getUser { [weak self] (result) in
                        switch result {
                           
                        case .success(let user):
                           self?.user = user
                           self?.notify()
                           completion(.success(user))
                        case .failure(_):
                           completion(.failure(AuthError.serverError))
                        }
                     }
      }
   }
   
   public func register(withEmail email: String?,
                 password: String?,
                 confirmPassword: String?,
                 completion: @escaping (Result<OkamaUser, Error>) -> Void) {

   }
   
   public func logout(completion: @escaping () -> Void) {
      auth.signOut { [weak self] in
         
         guard let self = self else { return }
         
         self.networking.checkIfAuthorized { [weak self] result in
            switch result {
               
            case .success(let authorized):
               self?.user = nil
               self?.notify()
               completion()
            case .failure(let error):
               print(error)
            }
         }
      }
   }
}




extension OkamaFlaskAuthService: AuthStatusPublisher {
   
   public func addListener(_ listener: AuthStatusListener) {
      listeners.append(listener)
   }
   
   public func removeListener(_ listener: AuthStatusListener) {
      listeners.removeAll { $0 === listener }
   }
   
   public func notify() {
      if let user = user {
         _ = listeners.map { $0.getAuthorized(with: user) }
      } else {
         _ = listeners.map { $0.getLogOut() }
      }
   }
   
}
