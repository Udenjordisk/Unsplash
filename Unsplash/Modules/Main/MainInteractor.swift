//
//  MainInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation
import Firebase

class MainInteractor: PresenterToInteractorMainProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMainProtocol?
    
    lazy var models = [DataModel]()

    final func getData(_ searchResult: String?) {
        Task {
            // get data 
            await APIService.shared.getUnsplashData(searchResult) { models in
                self.models = models
                self.presenter?.dataDidLoaded(models)
            }
        }
    }
    
    func backgroundGetFavoritePhotos(){
        
        FirebaseService.shared.getFavoritePhotos()
    }

}
