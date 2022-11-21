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

    lazy var imageView = UIImageView()
    let infoView = UIView()
    let authorLabel = UILabel()
    let likeButton = UIButton()
    let infoLabel = UILabel()
    let lineView = UIView()
    
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
        imageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height/1.5)
        imageView.contentMode = .scaleAspectFit
    }

    final private func setupInfoView() {
        infoView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        infoView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoView.translatesAutoresizingMaskIntoConstraints = false
    }

    final private func setupInfoViewSubviews() {
        infoView.addSubview(authorLabel)
        infoView.addSubview(likeButton)
        infoView.addSubview(infoLabel)
        infoView.addSubview(lineView)
        
        lineView.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        
        infoView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        setupAuthorLabel()
        setupLikeButton()
        setupInfoLabel()

    }

    final private func setupAuthorLabel() {
        authorLabel.numberOfLines = 1
        authorLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 20).isActive = true
    }

    final private func setupLikeButton() {
        likeButton.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -25).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        likeButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)

        presenter?.invalidateIsLikedButton()
    }

    final private func setupInfoLabel() {
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
        presenter?.likeButtonTapped()
    }

    @objc func showAdditionalInfo(_ sender: UITapGestureRecognizer) {
        presenter?.showAlert(view: self)
    }
    
}

extension DetailViewController: PresenterToViewDetailProtocol {
    
    func showDetail(url: URL, author: String) {
        self.imageView.sd_setImage(with: url)
        self.authorLabel.text = author
        self.infoLabel.text = "Show additional info"

    }

    func isLikedChanged(isLiked: Bool) {
        self.isLiked = isLiked
        presenter?.invalidateIsLikedButton()
    }

}
