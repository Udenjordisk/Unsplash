//
//  DetailInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import SDWebImage

class DetailInteractor: PresenterToInteractorDetailProtocol {

    var model: DataModel?

    // MARK: Properties
    var presenter: InteractorToPresenterDetailProtocol?
    init(_ model: DataModel) {

        self.model = model

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadData() {
        guard let model = model else { return }
        presenter?.showDetail(model: model)
        // TODO: Проверять есть ли лайк на фото и передавать в контроллер
        FirebaseService.shared.checkPhotoID(id: model.id) {[weak self] bool in
            self?.presenter?.isLikedChanged(isLiked: bool)
        }

    }

}
