//
//  MainPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {
  
    

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?

    func viewDidLoaded() {
         interactor?.getData()

    }
    
    func searchBarDidSearch(_ searchResult: String) {
        interactor?.searchPhoto(searchResult)
    }
    
}

extension MainPresenter: InteractorToPresenterMainProtocol {

    func dataDidLoaded(_ model: [DataModel]) {

        view?.reloadCollection(model)

    }

}
