//
//  MainContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainProtocol {
    func reloadCollection(_ models: [DataModel])
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainProtocol {

    var view: PresenterToViewMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }

    func viewDidLoaded()
    func searchBarDidSearch(_ searchResult: String)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainProtocol {

    var presenter: InteractorToPresenterMainProtocol? { get set }

    func getData()
    func searchPhoto(_ searchResult: String)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainProtocol {
    func dataDidLoaded(_ data: [DataModel])
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainProtocol {

}

// MARK: Cell configurable
protocol ConfigurableCell {
    func configure(_ model: DataModel)
}
