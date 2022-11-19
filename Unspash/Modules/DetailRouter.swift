//
//  DetailRouter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    // MARK: Static methods
    static func createModule(model: DataModel) -> UIViewController {
        
        let viewController = DetailViewController()
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor(model)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
