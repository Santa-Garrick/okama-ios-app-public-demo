//
//  LegendItem.swift
//  Okama
//
//  Created by Pro13 on 13.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit
import Charts

struct LegendItem {
   let name: String
   let highlightedValue: String
   let color: UIColor
}

struct SelectionItem<T> {
   let item: T
   var isSelected: Bool = false
}
