//
//  MovieCell.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import UIKit

class MovieCell: UITableViewCell {
    static let identifier = "movieCell"
    
    lazy var movieImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemYellow
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.9)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var movieRatingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        return label
    }()
    
    private lazy var starImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    lazy var descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .systemGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private lazy var rightImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(movieImageView)
        addSubview(movieNameLabel)
        movieImageView.addSubview(whiteView)
        whiteView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(starImageView)
        horizontalStackView.addArrangedSubview(movieRatingLabel)
        addSubview(dateLabel)
        addSubview(descLabel)
        addSubview(rightImageView)
        
        NSLayoutConstraint.activate([
            
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.27),
            
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieNameLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            movieNameLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -8),
            
            whiteView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.06),
            whiteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12),
            whiteView.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -4),
            whiteView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -4),
            
            horizontalStackView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 4),
            horizontalStackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 4),
            horizontalStackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -4),
            horizontalStackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -4),
            
            starImageView.widthAnchor.constraint(equalToConstant: 15),
            starImageView.heightAnchor.constraint(equalToConstant: 15),
            
            dateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -8),
            
            descLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -8),
            //descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            descLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            
            
            rightImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
            rightImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.03),
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
