//
//  MainViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import CHTCollectionViewWaterfallLayout

class MainViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterMainProtocol?
    var models: [DataModel] = []
    var timer: Timer?

    let searchController: UISearchController = {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "For example: Cute puppies"
            searchController.searchBar.searchBarStyle = .default
            searchController.definesPresentationContext = true
            return searchController
        }()
    
    // Collection view properties
    let collectionView: UICollectionView = {

        let waterfallLayout = CHTCollectionViewWaterfallLayout()
        waterfallLayout.columnCount = Int(Constants.columnCount)
        waterfallLayout.minimumColumnSpacing = Constants.spacing
        // FIXME: Иногда слишком большое расстояние между элементами вертикально
        // Это из-за рандомной высоты ячейки
        waterfallLayout.minimumInteritemSpacing = Constants.spacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: waterfallLayout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        return collectionView
        }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoaded()

        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        self.searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }

}

    // MARK: Presenter -> View methods

extension MainViewController: PresenterToViewMainProtocol {

    func reloadCollection(_ models: [DataModel]) {
        self.models = models
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

    // MARK: Collection view methods
extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.endEditing(true)
        presenter?.searchBarDidSearch(searchBar.searchTextField.text!)
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

    // MARK: Waterfall delegate methods

extension MainViewController: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / Constants.columnCount, height: 300)
    }
    

    

}
