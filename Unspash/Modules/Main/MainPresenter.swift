//
//  MainPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import CHTCollectionViewWaterfallLayout

class MainPresenter: ViewToPresenterMainProtocol {

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    
    var searchController: UISearchController = {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "For example: Cute puppies"
            searchController.searchBar.searchBarStyle = .default
            searchController.definesPresentationContext = true
            return searchController
        }()

    // Collection view properties
    var collectionView: UICollectionView = {

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

    func viewDidLoaded() {
         interactor?.getData()

    }

    func searchBarDidSearch(_ searchResult: String) {
        interactor?.searchPhoto(searchResult)
    }

    
}

extension MainPresenter: InteractorToPresenterMainProtocol {

    func dataDidLoaded(_ model: [DataModel]) {

        view?.reloadCollection(model)

    }

}
