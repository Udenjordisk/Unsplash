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
        APIService.shared.fetch(dataType: [DataModel].self, from: nil) { result in
                    switch result {
                    case .success(let models):
                        print(models)
//                        self.modelsArray = models
//                        self.photoCollection.reloadData()
                        return
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        
    }
}
