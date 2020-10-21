//
//  ConditionsDisplaying.swift
//  Okama
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


protocol ConditionsDisplaying: class {
   func display(date: String)
   func display(amount: String, currency: Currency)
   func setUI(_ state: UIState)
}
