//
//  FavoriteViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterFavoriteProtocol?
    
}

extension FavoriteViewController: PresenterToViewFavoriteProtocol{
    // TODO: Implement View Output Methods
}
