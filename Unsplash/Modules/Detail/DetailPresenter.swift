//
//  DetailPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

final class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    // MARK: View methods
    
    // Complete load
    func completeLoad(model: DataModel) {
        guard let url = URL(string: model.urls.small) else { return }
        let author = model.user.name
        view?.showDetail(url: url, author: author)
    }

    // MARK: - Like button methods
    func invalidateIsLikedButton() {
        
        guard let isLiked = interactor?.isLiked else { return }
        
        if isLiked {
            view?.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            view?.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    func likeButtonTapped() {
        
        interactor?.isLiked.toggle()
        guard let liked = interactor?.isLiked else { return }
        
        switch liked {
        case true:
            interactor?.addFavoritePhoto()
        case false:
            interactor?.removeFavoritePhoto()
        }
        invalidateIsLikedButton()
    }
}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
    func viewDidLoaded() {
        interactor?.loadData()
    }
    
    func showAlert(view: DetailViewController) {
        router?.showAlert(interactor?.model, view: view)
    }
  
}
