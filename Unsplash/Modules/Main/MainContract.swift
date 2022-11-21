//
//  MainContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainProtocol {
    func reloadCollection(_ models: [DataModel])
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainProtocol {

    var view: PresenterToViewMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }

    var searchController: UISearchController { get set }
    var collectionView: UICollectionView { get set }
    
    func countOfItems() -> Int
    func viewDidLoaded()
    func searchBarDidSearch(_ searchResult: String)
    func presentPhoto(index: Int, view: UIViewController)
    func configureCell(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainProtocol {

    var presenter: InteractorToPresenterMainProtocol? { get set }
    var models: [DataModel] { get }
    
    func getData(_ searchResult: String?)
    func backgroundGetFavoritePhotos()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainProtocol {
    func dataDidLoaded(_ data: [DataModel])
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainProtocol {
    func presentPhoto(_ model: DataModel, view: UIViewController)
}


