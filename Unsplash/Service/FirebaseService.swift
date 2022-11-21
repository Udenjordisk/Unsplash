//
//  FirebaseService.swift
//  Unspash
//
//  Created by Кирилл on 20.11.2022.
//

import UIKit
import Firebase

final class FirebaseService {

    static let shared = FirebaseService()

    var UID = ""
    
    // MARK: - Init firestore
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }

    func checkAuth() {
        
        if Auth.auth().currentUser != nil {
            
            FirebaseService.shared.UID = Auth.auth().currentUser?.uid ?? ""
            
        } else {
            Auth.auth().signInAnonymously { authResult, _ in
                // Anonymous authentification
                guard let user = authResult?.user else { return }
                FirebaseService.shared.UID = user.uid
            }
            
        }
    }

    // MARK: - Add photo to favorites in Firestore database
    func addFavoritePhoto(model: DataModel) {
        
        if UID != "" {
            
            configureFB()
                .collection("users").document(UID)
                .collection("favorite_photos").document(model.id)
                .setData([
                    "id": model.id,
                    "created_at": model.created_at ?? "",
                    "url_small": model.urls.small,
                    "url_full": model.urls.full,
                    "user_name": model.user.name,
                    "location_name": model.location?.name ?? "",
                    "downloads": model.downloads ?? 0,
                    "likes": model.likes
                ])
        }
    }

    // MARK: - Get documents from Firestore
    func getFavoritePhotos() {
                
        if UID != "" {
            // Get favorite photos ID grom firestore database
            configureFB()
                .collection("users").document(UID)
                .collection("favorite_photos")
                .getDocuments { snapshot, error in
                    guard let snapshot = snapshot else { return }
                    
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        FavoritePhotoManager.shared.handlePhoto(snapshot: snapshot) { models in
                            FavoritePhotoManager.shared.models.removeAll()
                            FavoritePhotoManager.shared.models.append(contentsOf: models)
                        }
                    }
                }
            
        }
    }
    // MARK: - Check like on photo (search photo id in Firestore)
    func checkPhotoID(id: String, completion: @escaping (Bool) -> Void) {
        
        if UID != "" {
            
            configureFB()
                .collection("users").document(UID)
                .collection("favorite_photos").document(id)
                .getDocument { document, _ in
                    if let document = document, document.exists {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
        }
    }
    // MARK: - Remove photo from database
    func removeFavoritePhoto(id: String) {
                
        if UID != "" {
            
            configureFB()
                .collection("users").document(UID)
                .collection("favorite_photos").document(id)
                .delete()
            
        }
    }

}
