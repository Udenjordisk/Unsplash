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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        view.backgroundColor = .white
    }

    
}

extension DetailViewController: PresenterToViewDetailProtocol{
   
    
    // TODO: Implement View Output Methods
}
