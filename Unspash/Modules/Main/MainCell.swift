//
//  CollectionViewCell.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "CollectionViewCell"

    lazy var imageView = UIImageView()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
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

        guard let url = URL(string: model.urls.small) else {return}
        imageView.sd_setImage(with: url, placeholderImage: nil, options: [.continueInBackground, .highPriority,.progressiveLoad])

    }
}
