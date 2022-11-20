//
//  FavoritePresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

class FavoritePresenter: ViewToPresenterFavoriteProtocol {

    // MARK: Properties
    var view: PresenterToViewFavoriteProtocol?
    var interactor: PresenterToInteractorFavoriteProtocol?
    var router: PresenterToRouterFavoriteProtocol?
    
    func showDetail(view: FavoriteViewController, index: Int) {
        
        guard let model = interactor?.manager.models[index] else { return }
        router?.presentPhoto(model, view: view)
    }
    
}



extension FavoritePresenter: InteractorToPresenterFavoriteProtocol {

}
