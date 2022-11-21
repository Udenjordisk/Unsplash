//
//  MainViews.swift
//  Unsplash
//
//  Created by Кирилл on 22.11.2022.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class MainViews {
    
    static let shared = MainViews()
        
    // MARK: - Search controller
   lazy var searchController: UISearchController = {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "For example: Cute puppies"
            searchController.searchBar.searchBarStyle = .default
            searchController.definesPresentationContext = true
            return searchController
        }()
    
    // MARK: - Collection view
    lazy var collectionView: UICollectionView = {

        let layout = CHTCollectionViewWaterfallLayout()
        layout.columnCount = Int(Constants.columnCount)
        layout.minimumInteritemSpacing = Constants.spacing

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

        return collectionView
        }()
}
