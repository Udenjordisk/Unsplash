//
//  FirebaseService.swift
//  Unspash
//
//  Created by Кирилл on 20.11.2022.
//

import UIKit
import Firebase

class FirebaseService {

    static let shared = FirebaseService()

    // MARK: Init firestore
    private final func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }

    // MARK: Auth user
    // TODO: Просто возвращать значение UID в string
    private final func authUser(completion: @escaping (String) -> Void) {
        Auth.auth().signInAnonymously { authResult, _ in
            // Anonymous authentification
            guard let user = authResult?.user else { return }
            let uid = user.uid
            completion(uid)
        }
    }

    // MARK: Add photo to favorites in Firestore database
    final func addFavoritePhoto(model: DataModel) {
        let UID = Auth.auth().currentUser?.uid ?? ""
        self.configureFB().collection("users").document(UID).collection("favorite_photos").document(model.id).setData([
                "created_at": model.created_at,
                "url_small": model.urls.small,
                "url_full": model.urls.full,
                "user_name": model.user.name,
                "location_name": model.location?.name,
                "downloads": model.downloads,
                "likes": model.likes
            ])
        
    }

    // MARK: Get documents from Firestore
    func getFavoritePhotos() {
        // User auth
        let UID = Auth.auth().currentUser?.uid ?? ""
        
            // Get favorite photos ID grom firestore database
        self.configureFB().collection("users").document(UID).collection("favorite_photos").getDocuments(completion: { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    for document in snapshot!.documents {
                                print("\(document.documentID) => \(document.data())")
                            }
                    
                }
            })
        
    }
    
    // MARK: Check like on photo (search photo id in Firestore)
    final func checkPhotoID(id: String, completion: @escaping (Bool) -> ()) {

        let UID = Auth.auth().currentUser?.uid ?? ""
        
           let docRef = configureFB().collection("users").document(UID).collection("favorite_photos").document(id)

            docRef.getDocument { document, _ in
                if let document = document, document.exists {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        

    }

}
