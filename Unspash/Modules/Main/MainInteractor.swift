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
    var favoriteIndeces = [String]()
    
    final func getData(_ searchResult: String?) {
        Task {
            // get data 
            await APIService.shared.getUnsplashData(searchResult) { models in
                self.presenter?.dataDidLoaded(models)
            }
        }
    }

    final func loadFirestoreData() {
        FirebaseService.shared.getFavoritePhotosID { documents in
            
            for index in 0...documents.count - 1 {
               let id = documents[index].data().values.first
                self.favoriteIndeces.append(id as! String)
            }
            print(self.favoriteIndeces)
            
        }
    }
    
}
