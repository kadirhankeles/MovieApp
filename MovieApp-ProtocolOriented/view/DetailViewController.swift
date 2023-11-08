//
//  DetailViewController.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 6.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var movieImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var yearLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    lazy var genreLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    lazy var minLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private lazy var horizontal2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var movieRatingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
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
    
    private lazy var overviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.text = "Overview:"
        return label
    }()
    
    lazy var descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private lazy var directorLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.text = "Director:"
        return label
    }()
    
    lazy var directorNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private lazy var actorsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.text = "Actor:"
        return label
    }()
    
    lazy var actorNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.dataTransfer()
        configure()
        setupUI()
    }
    
    private func configure() {
        if let navigationBar = navigationController?.navigationBar {
            if #available(iOS 15, *) {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                navigationBar.scrollEdgeAppearance = appearance
                navigationBar.standardAppearance = appearance
                navigationBar.compactAppearance = appearance
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .systemYellow
        view.addSubview(movieImageView)
        view.addSubview(movieNameLabel)
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(yearLabel)
        horizontalStackView.addArrangedSubview(genreLabel)
        horizontalStackView.addArrangedSubview(minLabel)
        view.addSubview(horizontal2StackView)
        horizontal2StackView.addArrangedSubview(starImageView)
        horizontal2StackView.addArrangedSubview(movieRatingLabel)
        view.addSubview(overviewLabel)
        view.addSubview(descLabel)
        view.addSubview(directorLabel)
        view.addSubview(directorNameLabel)
        view.addSubview(actorsLabel)
        view.addSubview(actorNameLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 16),
            movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            horizontalStackView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            horizontal2StackView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 5),
            horizontal2StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            starImageView.widthAnchor.constraint(equalToConstant: 16),
            starImageView.heightAnchor.constraint(equalToConstant: 16),
            
            overviewLabel.topAnchor.constraint(equalTo: horizontal2StackView.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            descLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 5),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            directorLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 16),
            directorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            directorNameLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 5),
            directorNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            actorsLabel.topAnchor.constraint(equalTo: directorNameLabel.bottomAnchor, constant: 16),
            actorsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            actorNameLabel.topAnchor.constraint(equalTo: actorsLabel.bottomAnchor, constant: 5),
            actorNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            actorNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
    
    
    
}

//MARK: - DetailViewModelOutput

extension DetailViewController: DetailViewModelOutput {
    func updateView(movie: Movie) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.movieImageView.kf.setImage(with: URL(string: (movie.poster)!), placeholder: UIImage(named: "noimage"))
            self.movieNameLabel.text = movie.title
            self.yearLabel.text = "•\(viewModel.getFormattedReleaseDate(for: movie))"
            self.genreLabel.text = "•\(viewModel.getFormattedGenre(for: movie))"
            self.minLabel.text = "•\(viewModel.getFormattedRuntime(for: movie))"
            self.movieRatingLabel.text = viewModel.getFormattedRating(for: movie)
            self.descLabel.text = viewModel.getFormattedDesc(for: movie)
            self.directorNameLabel.text = viewModel.getFormattedDirector(for: movie)
            self.actorNameLabel.text = viewModel.getFormattedActors(for: movie)
        }
    }
}
