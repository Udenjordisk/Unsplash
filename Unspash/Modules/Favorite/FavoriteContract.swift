//
//  FavoriteContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewFavoriteProtocol {

}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFavoriteProtocol {

    var view: PresenterToViewFavoriteProtocol? { get set }
    var interactor: PresenterToInteractorFavoriteProtocol? { get set }
    var router: PresenterToRouterFavoriteProtocol? { get set }
    
    func deletePhoto(_ tableView: UITableView,
                     _ editingStyle: UITableViewCell.EditingStyle,
                     _ indexPath: IndexPath)
    
    func countOfItems() -> Int
    func configureCell(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell
    func showDetail(view: FavoriteViewController, index: Int)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFavoriteProtocol {

    var presenter: InteractorToPresenterFavoriteProtocol? { get set }
    var photoManager: FavoritePhotoManager { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFavoriteProtocol {

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFavoriteProtocol {
    func presentPhoto(_ model: DataModel, view: FavoriteViewController)
}
