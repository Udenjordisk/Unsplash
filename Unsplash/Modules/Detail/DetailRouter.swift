//
//  DetailRouter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation
import UIKit

final class DetailRouter: PresenterToRouterDetailProtocol {

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

    // MARK: Show alert controller
    func showAlert(_ model: DataModel?, view: DetailViewController) {
        guard let model = model else { return }
        let likes = "Likes: \(model.likes.description)\n"
        let downloads = "Downloads: \(model.downloads?.description ?? "0")\n"
        let location = "Location: \(model.location?.name ?? "No location")\n"
        let message = likes + downloads + location

        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok" , style: .default) { _ in }
        let downloadAction = UIAlertAction(title: "Download", style: .default) { _ in
            UIImageWriteToSavedPhotosAlbum( view.imageView.image!, view, nil, nil)
        }

        alert.addAction(okAction)
        alert.addAction(downloadAction)

        view.present(alert, animated: true)
    }

}
