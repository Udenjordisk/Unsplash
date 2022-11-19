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
    
    // Search controller
   lazy var searchController: UISearchController = {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchBar.placeholder = "For example: Cute puppies"
            searchController.searchBar.searchBarStyle = .default
            searchController.definesPresentationContext = true
            return searchController
        }()

    // Collection view
    lazy var collectionView: UICollectionView = {

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

   final func viewDidLoaded() {
         interactor?.getData(nil)
    }

    final func searchBarDidSearch(_ searchResult: String) {
        interactor?.getData(searchResult)
    }

    final func presentPhoto(_ model: DataModel, view: UIViewController) {
        router?.presentPhoto(model, view: view)
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {

    func dataDidLoaded(_ model: [DataModel]) {

        view?.reloadCollection(model)

    }

}
