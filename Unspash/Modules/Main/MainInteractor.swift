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

    final func getData() {
        Task {
            await APIService.shared.getUnsplashData { models in
                self.presenter?.dataDidLoaded(models)
            }
        }
    }

    final func searchPhoto(_ searchResult: String) {
        print(searchResult)

    }

}
