//
//  MainPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import CHTCollectionViewWaterfallLayout

final class MainPresenter: ViewToPresenterMainProtocol {

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    
    // MARK: View did loaded
    func viewDidLoaded() {
         interactor?.getData(nil)
         interactor?.backgroundGetFavoritePhotos()

    }
    // MARK: Search bar did search
    func searchBarDidSearch(_ searchResult: String) {
        interactor?.getData(searchResult)
    }

    // MARK: Present detail
    func presentPhoto(index: Int, view: UIViewController) {
        
        guard let model = interactor?.models[index] else { return }
        router?.presentPhoto(model, view: view)
    }

    // MARK: Count of items in collection view
    func countOfItems() -> Int {
        guard let count = interactor?.models.count else { return 0 }
        
        return count
    }

    // MARK: Configure collection view cell
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
