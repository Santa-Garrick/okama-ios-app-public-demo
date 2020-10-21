//
//  AssetsDisplaying.swift
//  Okama
//
//  Created by Pro13 on 22.09.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


protocol AssetsDisplaying: class {
   func display(assets: [WeighedAsset])
   func displayRemoving(assetAtIndex index: Int)
}
