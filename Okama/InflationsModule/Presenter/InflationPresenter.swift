//
//  InflationPresenter.swift
//  Okama
//
//  Created by Pro13 on 16.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol InflationPresenterProtocol {
   init(with view: CurrencyView,
        service: InflationFetching)
   func requestInflation(for currency: Currency)
}
protocol CurrencyView: class {
   func showLoader()
   func showData(inflation: Inflation) 
}

class InflationPresenter: InflationPresenterProtocol {

   private var inflation: [Currency: Inflation] = [:]
   
   private var networking: InflationFetching!
   private weak var view: CurrencyView?
   
   private var fetchingCurrencies: Set<Currency> = []
   
   required init(with view: CurrencyView,
                 service: InflationFetching) {
      self.view = view
      self.networking = service
   }
   
   
   func requestInflation(for currency: Currency) {
            
      if inflation[currency] != nil {
         view?.showData(inflation: inflation[currency]!)
         return
      }
      view?.showLoader()

      if fetchingCurrencies.contains(currency) {
         return
      }
      
      fetchingCurrencies.insert(currency)
      
      networking.makeInflationQuery(for: currency) { [weak self] (result) in
         guard let self = self else { return }
         
         self.fetchingCurrencies.remove(currency)
         switch result {
         case .success(let currencyInflation):
            self.inflation[currency] = currencyInflation
            self.view?.showData(inflation: currencyInflation)
         case .failure(let error):
            print(error)
         }
      }
   }
}
