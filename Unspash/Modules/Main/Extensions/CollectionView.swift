//
//  CollectionView.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit
import CHTCollectionViewWaterfallLayout

// MARK: Collection view methods
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Number of items in section
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    // Cell for item
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.configure(models[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.presentPhoto(models[indexPath.row], view: self)
    }
    
}

// MARK: Waterfall delegate methods

extension MainViewController: CHTCollectionViewDelegateWaterfallLayout {
    // Size for item
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / Constants.columnCount, height: 300)
    }

}
