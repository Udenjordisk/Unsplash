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
            
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
            completion(uid)
        }
    }
    
    final func addFavoritePhoto(id: String) {
        authUser { [weak self] UID in
            self?.configureFB().collection("users").document(UID).collection("favorite_photos").addDocument(data: ["id":id])
        }
    }
    
    final func getFavoritePhotosID(completion: @escaping ([QueryDocumentSnapshot]) -> Void) {
        authUser { [weak self] UID in
            self?.configureFB().collection("users").document(UID).collection("favorite_photos").getDocuments(completion: { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion(snapshot!.documents)
                }
            })
        }
        
    }
}
