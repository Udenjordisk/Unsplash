//
//  FavoriteCell.swift
//  Unspash
//
//  Created by Кирилл on 20.11.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let identifier = "favoriteCell"
    
    var model: DataModel?
    
    private lazy var ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        setupLayout()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        ImageView.image = nil
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(ImageView)
        contentView.addSubview(authorLabel)
        
        ImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15).isActive = true
        ImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        ImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/10).isActive = true
        ImageView.image = UIImage(systemName: "heart")
        authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: ImageView.rightAnchor, constant: 10).isActive = true
        authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 5/10).isActive = true
    }
    
    
//    func configur(model: MainModel){
//            self.model = model
//
//            guard let url = URL(string: model.urls.small) else {return}
//
//        ImageView.sd_setImage(with: url, placeholderImage: nil, options: [.progressiveLoad,.continueInBackground], completed: nil)
//        authorLabel.text = model.user.name
//    }
     
    }
