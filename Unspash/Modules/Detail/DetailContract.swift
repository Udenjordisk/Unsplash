//
//  DetailContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol {
    var isLiked: Bool { get set }
    var imageView: UIImageView { get }
    var infoView: UIView { get }
    var authorLabel: UILabel { get }
    var likeButton: UIButton { get }
    var infoLabel: UILabel { get }
    
    func showDetail(url: URL, author: String)
    func isLikedChanged(isLiked: Bool)
    func invalidateIsLikedButton()

}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol {

    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }

    func viewDidLoaded()
    func showAlert(view: DetailViewController)
    func likeButtonTapped()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {

    var model: DataModel? { get set }
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    
    func loadData()
    func addFavoritePhoto()
    func removeFavoritePhoto()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    func completeLoad(model: DataModel)
    func isLikedChanged(isLiked: Bool)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    func showAlert(_ model: DataModel?, view: DetailViewController)
}
