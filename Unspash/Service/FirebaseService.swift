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
    
    private final func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    private final func authUser(completion: @escaping (String) -> Void) {
        Auth.auth().signInAnonymously { authResult, _ in
            // Anonymous authentification
            guard let user = authResult?.user else { return }
//            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
            completion(uid)
        }
    }
    
    final func addFavoritePhoto(id: String) {
        authUser { [weak self] UID in
            self?.configureFB().collection("users").document(UID).collection("favorite_photos").document(id).setData([:])
        }
    }
    
    final func getFavoritePhotosID(completion: @escaping ([QueryDocumentSnapshot]) -> Void) {
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
    
    final func checkPhotoID(id: String) {
        
        authUser { [weak self] UID in
            
           let docRef = self?.configureFB().collection("users").document(UID).collection("favorite_photos").document(id)
            
            docRef?.getDocument { document, _ in
                if let document = document, document.exists {
                    print("Document exist")
                } else {
                    print("Document does not exist")
                }
            }
        }
        
    }
}
