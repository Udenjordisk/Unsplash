//
//  FavoriteViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

final class FavoriteViewController: UIViewController {

    let tableView = UITableView()
    
    // MARK: - Properties
    var presenter: ViewToPresenterFavoriteProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor ).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(FavoriteCell.self,
                           forCellReuseIdentifier: FavoriteCell.identifier)
        
        tableView.rowHeight = Constants.rowHeight
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FavoriteViewController: PresenterToViewFavoriteProtocol {
    
}

