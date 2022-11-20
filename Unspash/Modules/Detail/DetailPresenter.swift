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

    var isLiked: Bool
    
    func showDetail(model: DataModel) {
        view?.showDetail(model: model)
    }

    func isLikedChanged(isLiked: Bool) {
        view?.isLikedChanged(isLiked: isLiked)
    }
    

}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func viewDidLoaded() {
        interactor?.loadData()
    }
    func like() {
        view?.isLiked.toggle()
        FirebaseService.shared.addFavoritePhoto(model: model!)
        FirebaseService.shared.getFavoritePhotos(model: model!)
    }
    func dislike() {
        isLiked.toggle()
    }
}
