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
//                StorageManager.shared.getData()
        navigationItem.leftBarButtonItem = editButtonItem
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
            //
            //                  let cell = FavoriteListTempStorage.shared.favoriteModels.remove(at: indexPath.row)
            //                  FavoriteListTempStorage.shared.likeChecker.remove(cell.id)
            //                  FavoriteListTempStorage.shared.likeChekerDict.removeValue(forKey: cell.id)
            //
            //
            //
            //                  StorageManager.shared.saveData()
            //
            self.tableView.reloadData()
        }
    }
}

extension FavoriteViewController: UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        as! FavoriteCell

        cell.imageView?.backgroundColor = .red
//        let model = FavoriteListTempStorage.shared.favoriteModels[indexPath.row]
//        cell.configur(model: model)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = FavoriteListTempStorage.shared.favoriteModels[indexPath.row]
// TO ROUTER
//        self.navigationController?.pushViewController(DetailRouter.createModule(model: model), animated: true)
    }

}
