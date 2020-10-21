//
//  GlossaryDataModel.swift
//  Okama
//
//  Created by Pro13 on 26.06.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

struct GlossaryData: Decodable {
   var terms: [Term]
   
}
struct Term: Decodable {
   let title: String?
   let url: String?
}
