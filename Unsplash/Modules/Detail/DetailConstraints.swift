//
//  DetailConstraints.swift
//  Unsplash
//
//  Created by Кирилл on 22.11.2022.
//

import UIKit

extension DetailViewController {
    
    // MARK: - UI Methods
    func setupUI() {

        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(infoView)

        setupImageView()
        setupInfoView()
        setupInfoViewSubviews()
    }

    private func setupImageView() {
        imageView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height/1.5)
        imageView.contentMode = .scaleAspectFit
    }

    private func setupInfoView() {
        infoView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        infoView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        infoView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupInfoViewSubviews() {
        infoView.addSubview(authorLabel)
        infoView.addSubview(infoLabel)
        infoView.addSubview(lineView)
        infoView.addSubview(likeButton)
        
        infoView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        // Setup subviews
        setupLineView()
        setupAuthorLabel()
        setupLikeButton()
        setupInfoLabel()
    }

    private func setupLineView() {
        lineView.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
    }
    
    private func setupAuthorLabel() {
        authorLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: infoView.leftAnchor, constant: 20).isActive = true
    }

    private func setupLikeButton() {
        likeButton.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -25).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        likeButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)

        presenter?.invalidateIsLikedButton()
    }

    private func setupInfoLabel() {
        infoLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showAdditionalInfo(_:)))
        infoLabel.addGestureRecognizer(recognizer)
    }
    
}
