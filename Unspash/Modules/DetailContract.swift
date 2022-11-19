//
//  DetailContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol {
    func showDetail(model: DataModel)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol {

    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }

    func viewDidLoaded()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {

    var presenter: InteractorToPresenterDetailProtocol? { get set }
    func loadData()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    func showDetail(model: DataModel)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {

}
