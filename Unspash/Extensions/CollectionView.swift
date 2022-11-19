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

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    models.count
}

func collectionView(_ collectionView: UICollectionView,
                    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

    cell.configure(models[indexPath.row])

    return cell

}

}

// MARK: Waterfall delegate methods

extension MainViewController: CHTCollectionViewDelegateWaterfallLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.size.width / Constants.columnCount, height: 300)
}

}
