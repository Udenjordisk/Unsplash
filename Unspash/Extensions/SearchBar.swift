//
//  SearchBar.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit

// MARK: Search bar methods
extension MainViewController: UISearchBarDelegate {
    // when user click search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController?.searchBar.endEditing(true)
        presenter?.searchBarDidSearch(searchBar.searchTextField.text!)
    }
}
