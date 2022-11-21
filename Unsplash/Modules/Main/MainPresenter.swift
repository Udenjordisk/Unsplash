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

        let layout = CHTCollectionViewWaterfallLayout()
        layout.columnCount = Int(Constants.columnCount)
        layout.minimumInteritemSpacing = Constants.spacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

        return collectionView
        }()
    
   final func viewDidLoaded() {
         interactor?.getData(nil)
         interactor?.backgroundGetFavoritePhotos()

    }

    final func searchBarDidSearch(_ searchResult: String) {
        interactor?.getData(searchResult)
    }

    final func presentPhoto(_ model: DataModel, view: UIViewController) {
        router?.presentPhoto(model, view: view)
    }
    
    func configureCell(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath, model: DataModel) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        guard let url = URL(string: model.urls.small) else { return UICollectionViewCell() }
        
        cell.imageView.sd_setImage(with: url, placeholderImage: nil, options: [.continueInBackground, .highPriority,.progressiveLoad])

        return cell
        
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {

    func dataDidLoaded(_ model: [DataModel]) {

        view?.reloadCollection(model)

    }

}
