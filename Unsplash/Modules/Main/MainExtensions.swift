//
//  MainExtensions.swift
//  Unsplash
//
//  Created by Кирилл on 22.11.2022.
//

import UIKit
import CHTCollectionViewWaterfallLayout

// MARK: Collection view methods
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    // Number of items in section
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter?.countOfItems() ?? 0
    }
    // Cell for item
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter?.configureCell(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.presentPhoto(index: indexPath.row, view: self)
    }

}

// MARK: Waterfall delegate methods

extension MainViewController: CHTCollectionViewDelegateWaterfallLayout {
    // Size for item
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / Constants.columnCount, height: Constants.height)
    }

}

// MARK: Search bar methods
extension MainViewController: UISearchBarDelegate {
    // when user click search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.endEditing(true)
        presenter?.searchBarDidSearch(searchBar.searchTextField.text!)
    }
}
