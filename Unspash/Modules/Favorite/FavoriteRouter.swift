//
//  FavoriteRouter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation
import UIKit

class FavoriteRouter: PresenterToRouterFavoriteProtocol {

    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = FavoriteViewController()

        let presenter: ViewToPresenterFavoriteProtocol & InteractorToPresenterFavoriteProtocol = FavoritePresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = FavoriteRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FavoriteInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

    func presentPhoto(_ model: DataModel, view: FavoriteViewController) {
        let detailVC = DetailRouter.createModule(model: model)
        detailVC.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
