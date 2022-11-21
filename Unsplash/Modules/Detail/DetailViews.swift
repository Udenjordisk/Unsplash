////
////  DetailViews.swift
////  Unsplash
////
////  Created by Кирилл on 22.11.2022.
////
//
//import UIKit
//
//class DetailViews: UIView {
//    
//    static let shared = DetailViews()
//    
//        lazy var lineView: UIView = {
//            let view = UIView()
//            lineView.layer.borderWidth = 1.0
//            lineView.layer.borderColor = UIColor.black.cgColor
//            return view
//        }()
//    
//        lazy var authorLabel: UILabel = {
//            let view = UILabel()
//            view.numberOfLines = 1
//            return view
//        }()
//    
//        lazy var infoLabel: UILabel = {
//            let view = UILabel()
//            view.font = .boldSystemFont(ofSize: 18)
//            view.textColor = .secondaryLabel
//            view.isUserInteractionEnabled = true
//            return view
//        }()
//  
//    func constraintsForImageView(boundsOf view: UIView) -> [NSLayoutConstraint] {
//            return [
//                topAnchor.constraint(equalTo: view.topAnchor),
//                leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                bottomAnchor.constraint(equalTo: bottomAnchor),
//                trailingAnchor.constraint(equalTo: trailingAnchor)
//            ]
//        }
//    
//}
