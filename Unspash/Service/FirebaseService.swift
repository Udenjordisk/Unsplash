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
    final func addFavoritePhoto(id: String) {
        authUser { [weak self] UID in
            self?.configureFB().collection("users").document(UID).collection("favorite_photos").document(id).setData([:])
        }
    }

    // MARK: Get documents from Firestore
    private final func getFavoritePhotosID(completion: @escaping ([QueryDocumentSnapshot]) -> Void) {
        // User auth
        authUser { [weak self] UID in

            // Get favorite photos ID grom firestore database
            self?.configureFB().collection("users").document(UID).collection("favorite_photos").getDocuments(completion: { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion(snapshot!.documents)
                }
            })
        }
    }

   // MARK: Create indeces array
    final func loadFirestoreData(completion: @escaping ([String]) -> Void) {

        var favoriteIndeces: Array = [String]()

        FirebaseService.shared.getFavoritePhotosID { documents in

            for index in 0...documents.count - 1 {
                let id = documents[index].data().values.first as! String
                favoriteIndeces.append(id)
            }
            completion(favoriteIndeces)

        }
    }

    // MARK: Check like on photo (search photo id in Firestore)
    final func checkPhotoID(id: String) {

        authUser { [weak self] UID in

           let docRef = self?.configureFB().collection("users").document(UID).collection("favorite_photos").document(id)

            docRef?.getDocument { document, _ in
                if let document = document, document.exists {
                    // TODO: Return true
                } else {
                    // TODO: Return false
                }
            }
        }

    }

}
