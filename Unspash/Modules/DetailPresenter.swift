//
//  DetailPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?

    func showDetail(model: DataModel) {
        view?.showDetail(model: model)
    }

    
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func viewDidLoaded() {
        interactor?.loadData()
    }
}
