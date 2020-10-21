//
//  SearchAsset.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol SearchAsset {
   var identifier: String { get }
   var title: String { get }
   var exchange: String? { get }
   var isAdded: Bool { get }
}

extension SelectionItem: SearchAsset where T == Asset {
   var identifier: String {
      item.identifier
   }
   
   var title: String {
      item.title
   }
   
   var exchange: String? {
      item.exchange
   }
   
   var isAdded: Bool {
      isSelected
   }
}

