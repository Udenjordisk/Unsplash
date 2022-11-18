//
//  FavoriteContract.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewFavoriteProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFavoriteProtocol {
    
    var view: PresenterToViewFavoriteProtocol? { get set }
    var interactor: PresenterToInteractorFavoriteProtocol? { get set }
    var router: PresenterToRouterFavoriteProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorFavoriteProtocol {
    
    var presenter: InteractorToPresenterFavoriteProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterFavoriteProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFavoriteProtocol {
    
}
