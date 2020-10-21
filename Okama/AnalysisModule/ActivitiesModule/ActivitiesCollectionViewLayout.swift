//
//  Custom2CollectionViewLayout.swift
//  Okama
//
//  Created by Pro13 on 12.07.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//


import UIKit

class ActivitiesCollectionViewLayout: UICollectionViewLayout {
   
   var numberOfColumns: Int { return itemsSizes.first?.count ?? 0 }

   var itemAttributes = [[UICollectionViewLayoutAttributes]]()
   var headerAttributes = [UICollectionViewLayoutAttributes]()
   
   var itemsSizes: [[CGSize]]
   var headerSize: CGSize!
   var contentSize: CGSize = .zero
      
   init(itemsSizes: [[CGSize]], headerSize: CGSize) {
      self.itemsSizes = itemsSizes
      self.headerSize = headerSize
      super.init()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func prepare() {
      guard let collectionView = collectionView else {
         return
      }
      
      if collectionView.numberOfSections == 0 {
         return
      }
      
      if itemAttributes.count != collectionView.numberOfSections ||
         headerAttributes.count != collectionView.numberOfSections {
         
         generateItemAttributes(collectionView: collectionView)
         generateHeaderAttributes(collectionView: collectionView)
         return
      }

      
      for section in 0 ..<  collectionView.numberOfSections {
         
         if collectionView.contentOffset.x < 0 {
            continue
         }
         
         for item in 0 ..< collectionView.numberOfItems(inSection: section) {
            
            if section != 0 && item != 0 {
               continue
            }
            
            let attributes = layoutAttributesForItem(at: IndexPath(item: item, section: section))!
            
            if section == 0 {
               var frame = attributes.frame
               frame.origin.y = collectionView.contentOffset.y
               attributes.frame = frame
            }
            
            if item == 0 {
               var frame = attributes.frame
               frame.origin.x = collectionView.contentOffset.x
               attributes.frame = frame
            }
                        
            
            
         }
         
         let attributes = layoutAttributesForSupplementaryView(ofKind: "", at: IndexPath(item: 0, section: section))!
         var frame = attributes.frame
      
         frame.origin.x = collectionView.contentOffset.x
         attributes.frame = frame
         
      }
   }
   
   override var collectionViewContentSize: CGSize {
      return contentSize
   }
   
   override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
      return itemAttributes[indexPath.section][indexPath.row]
   }
   
   override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
      return headerAttributes[indexPath.section]
   }
   
   override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      
      var attributes = [UICollectionViewLayoutAttributes]()
      for section in itemAttributes {
         let filteredArray = section.filter { obj -> Bool in
            return rect.intersects(obj.frame)
         }
         
         attributes.append(contentsOf: filteredArray)
      }
      
      for sectionHeader in headerAttributes {
         if sectionHeader.frame.intersects(rect) {
            attributes.append(sectionHeader)
         }
      }
      
      return attributes
   }
   
   override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
      return true
   }

   
}

// MARK: - Helpers
extension ActivitiesCollectionViewLayout {
      
   func generateHeaderAttributes(collectionView: UICollectionView) {
     
      headerAttributes = []
            
      var yOffset: CGFloat = 0

      for section in 0 ..< collectionView.numberOfSections {
         let sectionHeaderAttributes = UICollectionViewLayoutAttributes(
            forSupplementaryViewOfKind: HeaderView.kind,
            with: IndexPath(item: 0, section: section))
         //         let sectionHeaderAttributes = UICollectionViewLayoutAttributes(
         //             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
         //             with: IndexPath(item: 0, section: section))
   
         if section == 0 {
            sectionHeaderAttributes.frame = .zero
         } else {
            sectionHeaderAttributes.frame = CGRect(x: 0,
                                                   y: yOffset,
                                                   width: headerSize.width,
                                                   height: headerSize.height)
         }
         
         
         sectionHeaderAttributes.zIndex = 1021
         yOffset += itemsSizes[section][0].height + sectionHeaderAttributes.frame.height
         headerAttributes.append(sectionHeaderAttributes)
      }
      
      
   }
   
   func generateItemAttributes(collectionView: UICollectionView) {
      
      var column = 0
      var xOffset: CGFloat = 0
      var yOffset: CGFloat = 0
      var contentWidth: CGFloat = 0
      
      itemAttributes = []
      
      for section in 0 ..< collectionView.numberOfSections {
         var sectionAttributes: [UICollectionViewLayoutAttributes] = []
         
         for index in 0 ..< numberOfColumns {
            let itemSize = itemsSizes[section][index]
            let indexPath = IndexPath(item: index,
                                      section: section)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: xOffset,
                                      y: yOffset,
                                      width: itemSize.width,
                                      height: itemSize.height).integral
            
            if section == 0 && index == 0 {
               // First cell should be on top
               attributes.zIndex = 1024
            } else if section == 0 {
               // First row/column should be above other cells
               attributes.zIndex = 1023
            } else if index == 0 {
               attributes.zIndex = 1022
            }
            
            if section == 0 {
               var frame = attributes.frame
               frame.origin.y = collectionView.contentOffset.y
               attributes.frame = frame
            }
            if index == 0 {
               var frame = attributes.frame
               frame.origin.x = collectionView.contentOffset.x
               attributes.frame = frame
            }
            
            sectionAttributes.append(attributes)
            
            xOffset += itemSize.width
            column += 1
            
            if column == numberOfColumns {
               if xOffset > contentWidth {
                  contentWidth = xOffset
               }
               
               column = 0
               xOffset = 0
               yOffset += itemSize.height + headerSize.height
            }
         }
         
         itemAttributes.append(sectionAttributes)
      }
      
      if let attributes = itemAttributes.last?.last {
         contentSize = CGSize(width: contentWidth, height: attributes.frame.maxY)
      }
   }
   
}
