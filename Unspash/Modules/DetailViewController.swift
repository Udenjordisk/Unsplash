//
//  DetailViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterDetailProtocol?

    let imageView = UIImageView()

    let infoView = UIView()

    let authorLabel = UILabel()
    
    let likeButton = UIButton()
    var isLiked = false
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()

        setupUI()
    }

    final private func setupUI() {

        view.backgroundColor = .white

        imageView.frame = CGRect(x: 0, y: 20, width: view.bounds.width, height: view.bounds.height/1.5)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        setupInfoView()

    }

    final func setupInfoView() {
        
        view.addSubview(infoView)
        infoView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        infoView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.layer.borderWidth = 1.0
        infoView.layer.borderColor = UIColor.black.cgColor
        
        infoView.addSubview(authorLabel)
        infoView.addSubview(likeButton)

        authorLabel.numberOfLines = 1
        authorLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 20).isActive = true

        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -25).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        likeButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)

        infoView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    @objc func addToFavorite() {
        
        isLiked.toggle()
        
        switch isLiked {
            case true:
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            case false:
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }

    final func showDetail(model: DataModel) {
        
        let url = URL(string: model.urls.small)
        
        self.imageView.sd_setImage(with: url)
        self.authorLabel.text = model.user.name

    }

}

extension DetailViewController: PresenterToViewDetailProtocol {

    // TODO: Implement View Output Methods
}
