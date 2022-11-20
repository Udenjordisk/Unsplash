//
//  DataModel.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit
import Firebase


    


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

class FavoritePhotoManager {
    
    static let shared = FavoritePhotoManager()
    
    var models = [DataModel]()
    // MARK: - Handle favorite photos
    /// Handle  photos
    public func handlePhoto(snapshot: QuerySnapshot, finished: @escaping ([DataModel]) -> Void) {
        
        /// temp array with models
        var models = [DataModel]()
        /// count all docs
        let all = snapshot.documents.count
        
        /// check zero
        if all == 0 {
            finished([])
        }
        
        // count
        var count = 0
        
        /// handle
        for (_, document) in snapshot.documents.enumerated() {
            
            let urlSmall = document["url_small"]
            let urlFull = document["url_full"]

            let locationName = document["location_name"]
            
            let userName = document["user_name"]
            
            let id = document["id"]
            let createdAt = document["created_at"]
            let downloads = document["downloads"]
            let likes = document["likes"]
                
     
            let urls = Urls(
                full: urlFull as? String ?? "",
                small: urlSmall as? String ?? ""
            )
            
            let location = Location(
                name: locationName as? String ?? ""
                )
            let user = User(
                name: userName as? String ?? ""
            )
            /// make photo object
            let model = DataModel(
                id: id as? String ?? "",
                created_at: createdAt as? String ?? "",
                urls: urls,
                user: user,
                location: location,
                downloads: downloads as? Int ?? 0,
                likes: likes as? Int ?? 0
            )
            
            /// add model to array
            models.append(model)
                
            /// docs counter
            count += 1
            
            /// check finish
            if all == count {
                finished(models)
            }
                
            }
            
        }
        // end for
        
    }

