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

final class DetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterDetailProtocol?

    lazy var imageView = UIImageView()
    lazy var likeButton = UIButton()
    lazy var infoView = UIView()
    
    let lineView = DetailViews.shared.lineView
    let authorLabel = DetailViews.shared.authorLabel
    let infoLabel = DetailViews.shared.infoLabel
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        
        setupUI()
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

}
