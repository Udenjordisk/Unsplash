//
//  FavoriteExtensions.swift
//  Unsplash
//
//  Created by Кирилл on 22.11.2022.
//

import UIKit

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
