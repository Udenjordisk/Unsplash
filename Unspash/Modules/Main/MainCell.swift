//
//  CollectionViewCell.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit
import SDWebImage

protocol ConfigurableCell {
    func configure(_ model: DataModel)
}

class CollectionViewCell: UICollectionViewCell {

    //MARK: - Properties
    static let identifier = "CollectionViewCell"

    lazy var imageView = UIImageView()
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(systemName: "heart")
//        return imageView
//    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Override methods
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        imageView.contentMode = .scaleAspectFill
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

}

extension CollectionViewCell: ConfigurableCell {
    
    func configure(_ model: DataModel) {
        guard let url = URL(string: model.urls.full) else {return}
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"), options: [.progressiveLoad,.continueInBackground])
    }
}

