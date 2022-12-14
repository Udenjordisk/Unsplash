//
//  DetailInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import SDWebImage

final class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    // MARK: Properties
    var model: DataModel?
    
    var isLiked = false
    
    var presenter: InteractorToPresenterDetailProtocol?
    
    // MARK: Init
    init(_ model: DataModel) {
        self.model = model
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Check if image has been liked
    func loadData() {
        guard let model = model else { return }
        // Show data
        presenter?.completeLoad(model: model)
        // Check for like
        FirebaseService.shared.checkPhotoID(id: model.id) {[weak self] bool in
            self?.isLiked = bool
            self?.presenter?.invalidateIsLikedButton()
        }
    }

    // MARK: Like photo
    func addFavoritePhoto() {
        guard let model = model else { return }
        self.isLiked = true
        FirebaseService.shared.addFavoritePhoto(model: model)
        FirebaseService.shared.getFavoritePhotos()
    }
    
    // MARK: Dislike photo
    func removeFavoritePhoto() {
        guard let model = model else { return }
        self.isLiked = false
        FirebaseService.shared.removeFavoritePhoto(id: model.id)
        FirebaseService.shared.getFavoritePhotos()
    }
}
