//
//  SearchPresenterProtocol.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation

protocol SearchPresenterProtocol: class {
   var view: SearchDisplaying? { get set }
   var networking: Searching? { get set }
   var delegate: SearchDelegate? { get set }
   
   func requestData(forSearchText searchText: String)
   func selectItem(atIndex index: Int)
   func deselectItem(atIndex index: Int)
   func okTapped()
}
