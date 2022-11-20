//
//  DataModel.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit

struct LocalStorage {
    static let shared = LocalStorage()
    var models = [DataModel]()
}

struct DataModel: Codable {
    var id: String
    var created_at: String?
    var urls: Urls
    var user: User
    var location: Location?
    var downloads: Int?
    var likes: Int
}

struct Urls: Codable {
    var full: String
    var small: String
}

struct User: Codable {
    var name: String
}

struct Location: Codable {
    var name: String?
}
