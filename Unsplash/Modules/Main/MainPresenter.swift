//
//  MainPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import CHTCollectionViewWaterfallLayout

class MainPresenter: ViewToPresenterMainProtocol {    

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    
   final func viewDidLoaded() {
         interactor?.getData(nil)
         interactor?.backgroundGetFavoritePhotos()

    }

    final func searchBarDidSearch(_ searchResult: String) {
        interactor?.getData(searchResult)
    }

    final func presentPhoto(index: Int, view: UIViewController) {
        
        guard let model = interactor?.models[index] else { return }
        
        router?.presentPhoto(model, view: view)
    }
    
    func countOfItems() -> Int {
        guard let count = interactor?.models.count else { return 0 }
        
        return count
    }
    
    func configureCell(_ collectionView: UICollectionView,
                       cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        guard let model = interactor?.models[indexPath.row] else { return UICollectionViewCell() }
        
        guard let url = URL(string: model.urls.small) else { return UICollectionViewCell() }
        
        cell.imageView.sd_setImage(with: url, placeholderImage: nil, options: [.continueInBackground, .highPriority,.progressiveLoad])

        return cell
        
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {

    func dataDidLoaded(_ model: [DataModel]) {

        view?.reloadCollection(model)

    }

}
