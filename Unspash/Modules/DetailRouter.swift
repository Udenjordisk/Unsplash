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

    func showAlert(_ model: DataModel?, view: DetailViewController) {
        guard let model = model else { return }
        
        view.show(showAlert(model, view), sender: self)
    }
    
}

extension DetailRouter {
    func showAlert(_ model: DataModel,_ view: DetailViewController) -> UIAlertController{
        
        let likes = "Likes: \(model.likes.description)\n"
        let downloads = "Downloads: \(model.downloads?.description ?? "0")\n"
        let location = "Location: \(model.location?.name ?? "No location")\n"
        let message = likes + downloads + location
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok" , style: .default) { [weak self] _ in }
        let downloadAction = UIAlertAction(title: "Download", style: .default) { [weak self] _ in
           
            UIImageWriteToSavedPhotosAlbum( view.imageView.image!, view, nil, nil)
        }
        alert.addAction(okAction)
        alert.addAction(downloadAction)
        
        return alert
    }
}

extension DetailRouter {
   
//    private func showActivity(_ model: DataModel) {
//
//        let fileURL = URL(fileURLWithPath: path!)
//
//        // Create the Array which includes the files you want to share
//        var filesToShare = [Any]()
//
//        // Add the path of the file to the Array
//        filesToShare.append(fileURL)
//
//        // Make the activityViewContoller which shows the share-view
//        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
//
//        // Show the share-view
//        self.present(activityViewController, animated: true, completion: nil)
//    }
}
