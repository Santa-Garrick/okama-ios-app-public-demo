//
//  SearchViewProtocol.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol SearchDisplaying: class {
   var presenter: SearchPresenterProtocol! { get set }
   func display(assets: [SearchAsset])
   func display(title: String)
   func display(message: String)
}
