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
    var models: [DataModel] = []

    // Collection view properties
    let collectionView: UICollectionView = {

        let waterfallLayout = CollectionViewWaterfallLayout()
        waterfallLayout.columnCount = Int(Constants.columnCount)
        waterfallLayout.minimumColumnSpacing = Constants.spacing
        waterfallLayout.minimumInteritemSpacing = Constants.spacing

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: waterfallLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

        return collectionView
        }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoaded()

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds

    }

}
extension MainViewController: PresenterToViewMainProtocol {

    func reloadCollection(_ models: [DataModel]) {
        self.models = models
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

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
    // TODO: Избавиться от magic numbers
extension MainViewController: CollectionViewWaterfallLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        layout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: view.frame.size.width / Constants.columnCount, height: Constants.heightOfImage)

    }

}
