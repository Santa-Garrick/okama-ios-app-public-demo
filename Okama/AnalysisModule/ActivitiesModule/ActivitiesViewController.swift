//
//  ActivitiesViewController.swift
//  Okama
//
//  Created by Pro13 on 12.08.2020.
//  Copyright © 2020 Pro13. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
   
   var activities: ActivitiesTableModel!

   private var activitiesCollectionView: UICollectionView!
    
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .mainBackground
      
      setupCollectionView()
      setupLayout()
   }
   
   func setupCollectionView() {
      let layout = createLayout()
      activitiesCollectionView = UICollectionView(frame: .zero,
                                        collectionViewLayout: layout)
      
      activitiesCollectionView.isDirectionalLockEnabled = true
      
      activitiesCollectionView.dataSource = self
      activitiesCollectionView.delegate = self
      activitiesCollectionView.register(TitleCell.self,
                                        forCellWithReuseIdentifier: TitleCell.reuseID)
      activitiesCollectionView.register(ValueCell.self,
                                        forCellWithReuseIdentifier: ValueCell.reuseID)
      activitiesCollectionView.register(PeriodCell.self,
                                        forCellWithReuseIdentifier: PeriodCell.reuseID)
      
      activitiesCollectionView.register(HeaderView.self,
                              forSupplementaryViewOfKind: HeaderView.kind,
                              withReuseIdentifier: HeaderView.reuseID)
   }
   
   func setupLayout() {
      view.addSubview(activitiesCollectionView)
      activitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
   
      let marginsGuide = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
         
         activitiesCollectionView.topAnchor.constraint(equalTo: marginsGuide.topAnchor),
         activitiesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         activitiesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         activitiesCollectionView.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor),
         
      ])
   }

   func createLayout() -> ActivitiesCollectionViewLayout {
      
      let numberOfColumns = activities.numberOfColumns
      let numberOfSections = activities.numberOfRows
      
      var itemsSizes = [[CGSize]]()
      
      let maxNumberOfItemsOnScreen: CGFloat = 3
      let numberOfItemsOnScreen: CGFloat = min(CGFloat(numberOfColumns),
                                               maxNumberOfItemsOnScreen)
      let viewWidth = view.frame.size.width
      let itemWidth = viewWidth / numberOfItemsOnScreen
      let itemHeight: CGFloat = 26
      
      let names = activities.names
      let font = UIFont.systemFont(ofSize: 14)
      let firstSectionHeight = (names.map ({ $0.height(forFont: font,
                                                       width: itemWidth)
                                             }).max() ?? 0) + 8
      
      
            
      for section in 0 ..< numberOfSections {
         var sectionSizes = [CGSize]()
         for _ in 0 ..< numberOfColumns {
            let itemHeight = (section == 0) ? firstSectionHeight : itemHeight
            sectionSizes.append(CGSize(width: itemWidth,
                                       height: itemHeight))
         }
         itemsSizes.append(sectionSizes)
      }
      
      let headerSize = CGSize(width: view.frame.size.width,
                              height: 23)
      
      return ActivitiesCollectionViewLayout(itemsSizes: itemsSizes,
                                            headerSize: headerSize)
   }
   
   private func addGradient() {
      
      let colors = [UIColor.absoluteBackground.cgColor,
                    UIColor.mainBackground.cgColor]
      let gradientLayer = CAGradientLayer(withColors: colors,
                                          frame: view.frame,
                                          startPoint: CGPoint(x: 0,
                                                              y: 0.5),
                                          endPoint: CGPoint(x: 0.5,
                                                            y: 0.5))
      let bgView = UIView()
      bgView.layer.addSublayer(gradientLayer)
      activitiesCollectionView.backgroundView = bgView

   }
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      addGradient()
   }
   
}




extension ActivitiesViewController: UICollectionViewDataSource, UICollectionViewDelegate {

   // IMPORTANT!!!!:
   //
   // CollectionViewDataSource | ActivitiesTableModel
   //       section            |    row
   //       row                |    column
   //
   
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return activities.numberOfRows
   }
   
   func collectionView(_ collectionView: UICollectionView,
                       viewForSupplementaryElementOfKind kind: String,
                       at indexPath: IndexPath) -> UICollectionReusableView {
      
      let view = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderView.kind, withReuseIdentifier: HeaderView.reuseID, for: indexPath) as! HeaderView
      
      view.titleLabel.text = activities.title(forRow: indexPath.section) + ":"
      view.backgroundColor = .clear
      return view
   }
   
   func collectionView(_ collectionView: UICollectionView,
                       numberOfItemsInSection section: Int) -> Int {
      return activities.numberOfColumns
   }
   
   func collectionView(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
      var cell: ContentCollectionViewCell
      
      if indexPath.section == 0 {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.reuseID, for: indexPath) as! ContentCollectionViewCell
      } else if indexPath.section == 1 {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeriodCell.reuseID, for: indexPath) as! ContentCollectionViewCell
      } else {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: ValueCell.reuseID, for: indexPath) as! ContentCollectionViewCell
      }
      
      cell.backgroundColor = .mainBackground
      cell.configure(withText: activities.value(forRow: indexPath.section,
                                                andColumn: indexPath.row),
                     font: .systemFont(ofSize: 13, weight: .regular),
                     textAlignment: .left)
      
      return cell
   }
}

