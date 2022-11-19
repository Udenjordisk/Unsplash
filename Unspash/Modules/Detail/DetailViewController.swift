//
//  DetailViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import SDWebImage
import Firebase

class DetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterDetailProtocol?

    var model: DataModel?

    let imageView = UIImageView()
    let infoView = UIView()
    let authorLabel = UILabel()
    let likeButton = UIButton()
    let infoLabel = UILabel()
    var isLiked = false

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()

        setupUI()
    }

    // MARK: - UI Methods

    final private func setupUI() {

        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(infoView)

        setupImageView()
        setupInfoView()
        setupInfoViewSubviews()
    }

    final private func setupImageView() {
        imageView.frame = CGRect(x: 0, y: 20, width: view.bounds.width, height: view.bounds.height/1.5)
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: URL(string: (model?.urls.small)!))
    }

    final private func setupInfoView() {
        infoView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        infoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.layer.borderWidth = 1.0
        infoView.layer.borderColor = UIColor.black.cgColor
    }

    final private func setupInfoViewSubviews() {
        infoView.addSubview(authorLabel)
        infoView.addSubview(likeButton)
        infoView.addSubview(infoLabel)

        infoView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        setupAuthorLabel()
        setupLikeButton()
        setupInfoLabel()

    }

    final private func setupAuthorLabel() {
        authorLabel.text = model?.user.name
        authorLabel.numberOfLines = 1
        authorLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 20).isActive = true
    }

    final private func setupLikeButton() {
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -25).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        likeButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
    }

    final private func setupInfoLabel() {
        infoLabel.text = "Show additional info"
        infoLabel.font = .boldSystemFont(ofSize: 18)
        infoLabel.textColor = .secondaryLabel

        infoLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        infoLabel.isUserInteractionEnabled = true

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showAdditionalInfo(_:)))
        infoLabel.addGestureRecognizer(recognizer)
    }

    // MARK: - Tap actions

    @objc func addToFavorite() {

        isLiked.toggle()

        switch isLiked {
            case true:
//            FirebaseService.shared.addFavoritePhoto(id: (model?.id.description)!)
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            case false:
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }

    }

    @objc func showAdditionalInfo(_ sender: UITapGestureRecognizer) {
        presenter?.router?.showAlert(model, view: self)
    }

}

extension DetailViewController: PresenterToViewDetailProtocol {

    final func showDetail(model: DataModel) {
        self.model = model
    }

}
