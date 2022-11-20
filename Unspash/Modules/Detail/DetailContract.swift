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

    
    func showDetail(model: DataModel)

    func isLikedChanged(isLiked: Bool)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol {

    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }

    func viewDidLoaded()
    func like()
    func dislike()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {

    var presenter: InteractorToPresenterDetailProtocol? { get set }
    func loadData()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    func showDetail(model: DataModel)

    func isLikedChanged(isLiked: Bool)

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    func showAlert(_ model: DataModel?, view: DetailViewController)
}
