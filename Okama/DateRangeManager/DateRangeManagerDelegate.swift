//
//  DateRangeManagerDelegate.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


protocol DateRangeManagerDelegate: class {
   func startUpdating()
   func dateRangeDidUpdate(result: Result<DateInterval, Error>)
}


