//
//  DetailInteractor.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//  
//

import UIKit
import SDWebImage

class DetailInteractor: PresenterToInteractorDetailProtocol {

    var model: DataModel?

    // MARK: Properties
    var presenter: InteractorToPresenterDetailProtocol?
    init(_ model: DataModel) {

        self.model = model

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadData() {
        guard let model = model else { return }
        FirebaseService.shared.checkPhotoID(id: model.id)
//        var array = FirebaseService.shared.loadFirestoreData() as Array
//
//        FirebaseService.shared.loadFirestoreData { array in
//            for index in 0 ... array.count - 1 {
//                        if array[index] != model!.id {
//                            array.remove(at: index)
//                        }
////                    }
//                    if !array.isEmpty {
//                        presenter?.showDetail(model: model!, isLiked: true)
                   
            
       
            presenter?.showDetail(model: model, isLiked: false)
//        }
//        
//        
        
        
    }

}
