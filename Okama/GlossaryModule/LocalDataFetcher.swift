//
//  LocalDataFetcher.swift
//  Okama
//
//  Created by Pro13 on 26.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

enum LocalDataError: Error {
   case wrongResourse
   var localizedDescription: String {
      switch self {
      case .wrongResourse:
         return "the file could not be located"
      }
   }
}
class LocalDataFetcher {
   func fetchTerms(_ completion: (Result<[Term], Error>) -> Void) {
      guard
         let url = Bundle.main.url(forResource: "Glossary",
                                   withExtension: "json")
         else {
            completion(.failure(LocalDataError.wrongResourse))
            return
      }
      var data: Data
      do {
         data = try Data(contentsOf: url)
      } catch {
         completion(.failure(error))
         return
      }
      
      do {
         let decoded = try JSONDecoder().decode(GlossaryData.self, from: data)
         completion(.success(decoded.terms))
      } catch {
         completion(.failure(error))
      }
   }
}
