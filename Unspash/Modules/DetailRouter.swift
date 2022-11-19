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

    func showAlert(_ model: DataModel?, view: UIViewController) {
        guard let model = model else { return }
        
        view.show(showAlert(model), sender: self)
    }
    
}

extension DetailRouter {
    func showAlert(_ model: DataModel) -> UIAlertController{
        
        let likes = "Likes: \(model.likes.description)\n"
        let downloads = "Downloads: \(model.downloads?.description ?? "0")\n"
        let location = "Location: \(model.location?.name ?? "No location")\n"
        let message = likes + downloads + location
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok" , style: .default) { [weak self] _ in }
        let downloadAction = UIAlertAction(title: "Download", style: .default) { [weak self] _ in
            
        }
        alert.addAction(okAction)
        alert.addAction(downloadAction)
        
        return alert
    }
}
