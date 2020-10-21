//
//  DateRangeManagerProtocol.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol DateRangeManagerProtocol: class {
   init(with service: AvailableDatesFetching)
   var delegate: DateRangeManagerDelegate? { get set }

   func add(asset: Asset)
   func remove(asset: Asset)
}
