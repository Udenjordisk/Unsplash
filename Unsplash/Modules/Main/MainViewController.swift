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

final class MainViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?
        
    lazy var searchController = MainViews.shared.searchController
    lazy var collectionView = MainViews.shared.collectionView
    
    private let refreshControl = UIRefreshControl()
    
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

    // MARK: Setup UI
    private func setupUI() {

        // Setup search bar
        self.searchController.searchBar.delegate = self
        navigationItem.searchController = searchController

        // Setup collection view
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
        view.addSubview(collectionView)

        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
    }
    
    @objc private func refresh(_ sender: Any) {
        // Fetch photo
        presenter?.viewDidLoaded()
        // End refreshing
        refreshControl.endRefreshing()
        // Reload data
        collectionView.reloadData()
    }
    
}

    // MARK: Presenter -> View methods

extension MainViewController: PresenterToViewMainProtocol {

    func reloadCollection(_ models: [DataModel]) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

