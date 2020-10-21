//
//  Asset.swift
//  Okama
//
//  Created by Pro13 on 18.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


public struct Asset: Codable, Equatable, Hashable {
   let identifier: String
   let title: String
   let exchange: String?
}

