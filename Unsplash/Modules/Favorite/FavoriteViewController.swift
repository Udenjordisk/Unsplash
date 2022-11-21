//
//  FavoriteViewController.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit

class FavoriteViewController: UIViewController {

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
        
        tableView.rowHeight = 150
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FavoriteViewController: PresenterToViewFavoriteProtocol {
    
}


extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view delegate
    // Remove
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter?.deletePhoto(tableView, editingStyle, indexPath)
    }
    
    // MARK: - Table view data source
    // Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.countOfItems() ?? 0
    }
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.configureCell(tableView, indexPath) ?? UITableViewCell()
    }
    // Tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //To router
        presenter?.showDetail(view: self, index: indexPath.row)
    }

}
