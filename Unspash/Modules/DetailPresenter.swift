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
//
//
//    imageView.contentMode = .scaleAspectFill
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
//    imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//    imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//    imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//
//    view.addSubview(authorLabel)
//    authorLabel.numberOfLines = 4
//    authorLabel.translatesAutoresizingMaskIntoConstraints = false
//    authorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true
//    authorLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 25).isActive = true
//
//    view.addSubview(likeButton)
//    likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//    likeButton.translatesAutoresizingMaskIntoConstraints = false
//    likeButton.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -25).isActive = true
//    likeButton.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
//    likeButton.addTarget(self, action: #selector(), for: .touchUpInside)
//
    func showDetail(model: DataModel) {
        view?.showDetail(model: model)
    }

}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func viewDidLoaded() {
        interactor?.loadData()
    }
}
