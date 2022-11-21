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
