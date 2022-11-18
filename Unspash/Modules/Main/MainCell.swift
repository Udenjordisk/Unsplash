//
//  CollectionViewCell.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    //MARK: - Properties
    
    static let identifier = "CollectionViewCell"

    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "heart")
        return imageView
    }()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

}
