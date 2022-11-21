//
//  FavoriteInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

final class FavoriteInteractor: PresenterToInteractorFavoriteProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterFavoriteProtocol?
    
    var photoManager = FavoritePhotoManager.shared
    
}
