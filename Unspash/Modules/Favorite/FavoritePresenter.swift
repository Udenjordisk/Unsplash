//
//  FavoritePresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

class FavoritePresenter: ViewToPresenterFavoriteProtocol {

    // MARK: Properties
    var view: PresenterToViewFavoriteProtocol?
    var interactor: PresenterToInteractorFavoriteProtocol?
    var router: PresenterToRouterFavoriteProtocol?
    
    // MARK: Delete photo from favorites
    func deletePhoto(_ tableView: UITableView,
                     _ editingStyle: UITableViewCell.EditingStyle,
                     _ indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //Remove from database
            FirebaseService.shared.removeFavoritePhoto(id: FavoritePhotoManager.shared.models[indexPath.row].id)
            //Remove from table view
            let cell = FavoritePhotoManager.shared.models.remove(at: indexPath.row)
            //Update favorite photos
            FirebaseService.shared.getFavoritePhotos()
            //Reload table view
            tableView.reloadData()
        }
        
    }
    
    // MARK: Return count of favorite photos
    func countOfItems() -> Int {
        guard let manager = interactor?.photoManager else { return 0 }
        return manager.models.count
    }
    
    // MARK: Return cell for photo
    func configureCell(_ tableView: UITableView,_ indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        
        guard let model = interactor?.photoManager.models[indexPath.row] else { return UITableViewCell() }
        guard let url = URL(string: model.urls.small) else { return UITableViewCell()}

        cell.ImageView.sd_setImage(with: url, placeholderImage: nil, options: [.progressiveLoad,.continueInBackground], completed: nil)
        cell.authorLabel.text = model.user.name
        cell.likedLabel.text = "Likes: " + model.likes.description
        
        if model.location?.name != "" {
            cell.locationLabel.text = "Location: \n" + (model.location?.name)!
        }
        
        return cell
    }
    
    // MARK: Tap on item
    func showDetail(view: FavoriteViewController, index: Int) {
        guard let model = interactor?.photoManager.models[index] else { return }
        router?.presentPhoto(model, view: view)
    }
    
}

extension FavoritePresenter: InteractorToPresenterFavoriteProtocol {

}
