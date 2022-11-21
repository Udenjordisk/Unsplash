//
//  MainRouter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation
import UIKit

final class MainRouter: PresenterToRouterMainProtocol {

    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = MainViewController()

        let presenter: ViewToPresenterMainProtocol & InteractorToPresenterMainProtocol = MainPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = MainRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

    // MARK: Present detail
    func presentPhoto(_ model: DataModel, view: UIViewController) {
        let detailVC = DetailRouter.createModule(model: model)
        detailVC.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(detailVC, animated: true)
    }
}
