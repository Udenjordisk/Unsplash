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

    final func getData(_ searchResult: String?) {
        Task {
            
            await APIService.shared.getUnsplashData(searchResult) { models in
                self.presenter?.dataDidLoaded(models)
            }
        }
    }

    

}
