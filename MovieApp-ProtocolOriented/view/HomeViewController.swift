//
//  ViewController.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    private lazy var searchMovieBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search Movie"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .gray
        searchBar.searchTextField.tintColor = .white
        return searchBar
    }()
    
    private lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.rowHeight = view.bounds.width * 0.45
        tableView.backgroundColor = .clear
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        return tableView
    }()

    lazy var movieNotFoundLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemYellow
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.text = "Movie not found!"
        label.isHidden = true
        return label
    }()
    
    private let viewModel: HomeViewModel
    var movieList = [Movie]()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchInitialMovies()
        configure()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemYellow, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!]
        print("çalıştı")
    }

    
    private func configure() {
        searchMovieBar.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    private func setupUI() {
        title = "Movie App"
        view.backgroundColor = .black
        
        
        view.addSubview(searchMovieBar)
        view.addSubview(moviesTableView)
        view.addSubview(movieNotFoundLabel)
        
        NSLayoutConstraint.activate([
            searchMovieBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchMovieBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchMovieBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchMovieBar.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.1),
            
            moviesTableView.topAnchor.constraint(equalTo: searchMovieBar.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieNotFoundLabel.topAnchor.constraint(equalTo: searchMovieBar.bottomAnchor),
            movieNotFoundLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieNotFoundLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieNotFoundLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - MovieViewModelOutput

extension HomeViewController: HomeViewModelOutput {
    func showMovieNotFoundView() {
        DispatchQueue.main.async {
            self.movieNotFoundLabel.isHidden = false
            self.moviesTableView.isHidden = true
        }

    }
    
    func hideMovieNotFoundView() {
        DispatchQueue.main.async {
            self.movieNotFoundLabel.isHidden = true
            self.moviesTableView.isHidden = false
        }

    }
    
    func updateView(movieList: [Movie]) {
        DispatchQueue.main.async {
            self.movieList = movieList
            self.moviesTableView.reloadData()
        }
    }
    
    func scrollToFirstItem() {
        DispatchQueue.main.async {
            self.moviesTableView.scrollToRow(at: .init(row: .zero, section: .zero), at: .top, animated: true)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        
        if let imageURL = URL(string: movieList[indexPath.row].poster ?? "") {
            cell.movieImageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "noimage"))
        } else {
            cell.movieImageView.image = UIImage(named: "noimage")
        }
        
        let movie = movieList[indexPath.row]
        cell.movieNameLabel.text = movie.title
        cell.movieRatingLabel.text = viewModel.getFormattedRating(for: movie)
        cell.dateLabel.text = viewModel.getFormattedReleaseDate(for: movie)
        cell.descLabel.text = viewModel.getFormattedDesc(for: movie)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVM = DetailViewModel(selectedMovieDetail: movieList[indexPath.row])
        let detailVC = DetailViewController(viewModel: detailVM)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let tableViewHeight = scrollView.frame.size.height
        
        guard offsetY > contentHeight - tableViewHeight, viewModel.lastSearch != "" else { return }
        viewModel.searchMovie(movieName: viewModel.lastSearch)
    }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, searchText.count > 2 else { return }
        //searchBar.text = ""
        viewModel.searchMovie(movieName: searchText)
    }
}

