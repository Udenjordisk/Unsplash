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

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(FavoriteCell.self,
                           forCellReuseIdentifier: FavoriteCell.identifier)

        tableView.rowHeight = 150
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            tableView.reloadData()
        }

    // MARK: - Properties
    var presenter: ViewToPresenterFavoriteProtocol?

}

extension FavoriteViewController: PresenterToViewFavoriteProtocol {
    // TODO: Implement View Output Methods
}

// MARK: - Table view delegate
extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = FavoritePhotoManager.shared.models.remove(at: indexPath.row)
            //Remove from database
            self.tableView.reloadData()
        }
    }
}

extension FavoriteViewController: UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FavoritePhotoManager.shared.models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        as! FavoriteCell

        let model = FavoritePhotoManager.shared.models[indexPath.row]
        
        cell.configure(model: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//To router
    }

}
