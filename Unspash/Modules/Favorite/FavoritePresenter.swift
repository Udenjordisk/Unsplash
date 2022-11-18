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
}

extension FavoritePresenter: InteractorToPresenterFavoriteProtocol {
    
}
