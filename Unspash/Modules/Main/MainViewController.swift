//
//  MainViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import CollectionViewWaterfallLayout

class MainViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?

    // Collection view properties

    let collectionView: UICollectionView = {

        let waterfallLayout = CollectionViewWaterfallLayout()
        waterfallLayout.columnCount = 2
        waterfallLayout.minimumColumnSpacing = 10
        waterfallLayout.minimumInteritemSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: waterfallLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

        return collectionView
        }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
                view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds

    }

    // MARK: - UI Methods
    private final func setupUI() {
        view.backgroundColor = .white
    }

}
extension MainViewController: PresenterToViewMainProtocol {
    // TODO: Implement View Output Methods
}

// extension MainViewController: UICollectionViewDelegate {
//
// }

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)

        return cell

    }

}
extension MainViewController: CollectionViewWaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2, height: CGFloat.random(in: 250...400))

    }

}
