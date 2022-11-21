//
//  MainViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import Firebase
import CHTCollectionViewWaterfallLayout

class MainViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?
    
    lazy var models: [DataModel] = []
    
    weak var searchController: UISearchController?
    weak var collectionView: UICollectionView?

    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add a new document with a generated ID
        presenter?.viewDidLoaded()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       setupUI()
    }

    private final func setupUI() {

        // Setup search bar
        self.searchController = presenter?.searchController
        self.searchController?.searchBar.delegate = self
        navigationItem.searchController = searchController

        // Setup collection view
        self.collectionView = presenter?.collectionView
        collectionView?.frame = view.bounds
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView!)

    }

}

    // MARK: Presenter -> View methods

extension MainViewController: PresenterToViewMainProtocol {

    func reloadCollection(_ models: [DataModel]) {
        self.models = models
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }

}

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
        presenter?.configureCell(collectionView, cellForItemAt: indexPath, model: models[indexPath.row]) ?? UICollectionViewCell()
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

// MARK: Search bar methods
extension MainViewController: UISearchBarDelegate {
    // when user click search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController?.searchBar.endEditing(true)
        presenter?.searchBarDidSearch(searchBar.searchTextField.text!)
    }
}
