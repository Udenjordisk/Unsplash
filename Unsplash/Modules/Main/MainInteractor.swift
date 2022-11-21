//
//  MainInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMainProtocol?
    
    lazy var models = [DataModel]()

    final func getData(_ searchResult: String?) {
        Task {
            // get data 
            await APIService.shared.getUnsplashData(searchResult) { [weak self] models in
                self?.models = models
                self?.presenter?.dataDidLoaded(models)
            }
        }
    }
    
    final func backgroundGetFavoritePhotos(){
        FirebaseService.shared.getFavoritePhotos()
    }

}
