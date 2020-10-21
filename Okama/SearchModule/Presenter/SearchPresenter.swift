//
//  SearchPresenter.swift
//  Okama
//
//  Created by Pro13 on 30.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import Foundation


class SearchPresenter: SearchPresenterProtocol {
   
   var view: SearchDisplaying?
   
   var networking: Searching?
   var delegate: SearchDelegate?
   
   private var fetchedAssets: [Asset] = []
   private var selected: Set<Asset> = [] {
      didSet {
         view?.display(title: title)
      }
   }
   
   private var title: String {
      if selected.isEmpty {
         return K.SearchModule.addTitle
      } else {
         return K.SearchModule.addedTitle + ": +\(selected.count)"
      }
   }
   
   private var assetsToPresent: [SearchAsset] {
      return fetchedAssets.map { asset in
         let isSelected = self.selected.contains(asset)
         return SelectionItem<Asset>(item: asset,
                                     isSelected: isSelected) }
   }
   
   func requestData(forSearchText searchText: String) {
      if searchText.isEmpty {
         view?.display(assets: [])
         return
      }
      networking?.makeSearchQuery(with: searchText) { [weak self] (result) in
         guard let self = self else { return }

         switch result {
         case .success(let assets):
            self.fetchedAssets = assets
            self.view?.display(assets: self.assetsToPresent)
            if assets.isEmpty {
               self.view?.display(message: K.SearchModule.emptyResultMessage)
            }
         case .failure(_):
            self.view?.display(message: K.SearchModule.errorMessage)
         }
      }
   }
   
   func selectItem(atIndex index: Int) {
      selected.insert(fetchedAssets[index])
      view?.display(assets: assetsToPresent)
   }
   func deselectItem(atIndex index: Int) {
      selected.remove(fetchedAssets[index])
      view?.display(assets: assetsToPresent)
   }
   func okTapped() {
      delegate?.addAssets(Array(selected))
   }

}
