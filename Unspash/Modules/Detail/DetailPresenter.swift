//
//  DetailPresenter.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    func completeLoad(model: DataModel) {
        guard let url = URL(string: model.urls.small) else { return }
        let author = model.user.name
        view?.showDetail(url: url, author: author)
    }

    func isLikedChanged(isLiked: Bool) {
        view?.isLikedChanged(isLiked: isLiked)
    }
    
    private func invalidateIsLikedButton() {
        
        guard let isLiked = view?.isLiked else { return }
        
        if isLiked {
            view?.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            view?.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    func likeButtonTapped() {
        
        view?.isLiked.toggle()
        
        guard let liked = view?.isLiked else { return }
        
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
