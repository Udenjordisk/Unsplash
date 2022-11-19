//
//  DetailPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func viewDidLoaded() {
        interactor?.loadData()
    }
}
