//
//  MovieViewModel.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import Foundation

//MARK: - MovieViewModelOutput
protocol HomeViewModelOutput {
    func updateView(movieList: [Movie])
    func showMovieNotFoundView()
    func hideMovieNotFoundView()
    func scrollToFirstItem()
}

//MARK: - MovieViewModel
class HomeViewModel {
    private let movieService: MovieService
    private let initialMovieIds = [
        "tt4589218",
        "tt5537002",
        "tt15257160",
        "tt22687790",
        "tt1136617",
        "tt15671028",
        "tt18394190",
        "tt11389872",
        "tt10638522",
        "tt0107120"
    ]
    
    var output: HomeViewModelOutput?
    var movieList = [Movie]()
    var currentPage = 0
    var totalPage = 0
    var lastSearch = ""
    
    init(movieService: MovieService) {
        self.movieService = movieService
        
    }
    
    func fetchInitialMovies() {
        fetchMovies(movieIds: initialMovieIds)
    }
    
    func fetchMovies(movieIds: [String]) {
        for movieId in movieIds {
            movieService.fetchMovie(movieId: movieId) { result in
                switch result {
                case .success(let movie):
                    self.movieList.append(movie)
                    self.output?.updateView(movieList: self.movieList)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchMovie(movieName: String) {
        let modifiedMovieName = replaceSpacesWithPlus(in: movieName)

        if lastSearch != movieName {
            movieList.removeAll()
            lastSearch = movieName
            currentPage = 1
            output?.scrollToFirstItem()
        } else {
            if currentPage < totalPage {
                currentPage += 1
            } else {
                return
            }
        }

        movieService.searchMovie(movieName: modifiedMovieName, pageNumber: currentPage) { [weak self] result in
            switch result {
            case .success(let searchList):
                guard let movieList = searchList.search,
                      let response = searchList.response,
                      let totalPage = searchList.totalResults,
                      response == "True" else {
                    self?.output?.showMovieNotFoundView()
                    return
                }

                self?.output?.hideMovieNotFoundView()
                self?.totalPage = (self?.stringToInt(totalPage) ?? .zero  + 10 - 1) / 10
                let movieIds = movieList.map { $0.imdbID }
                self?.fetchMovies(movieIds: movieIds)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func replaceSpacesWithPlus(in movieName: String) -> String {
        return movieName.replacingOccurrences(of: " ", with: "+")
    }
    
    func getFormattedRating(for movie: Movie) -> String {
        if movie.imdbRating == "N/A" {
            return "—"
        } else {
            return movie.imdbRating!
        }
    }
    
    func getFormattedReleaseDate(for movie: Movie) -> String {
        if movie.released == "N/A" {
            return "No information found"
        } else {
            return movie.released!
        }
    }
    
    func getFormattedDesc(for movie: Movie) -> String {
        if movie.plot == "N/A" {
            return "No description of this movie was found"
        } else {
            return movie.plot!
        }
    }
    
    func stringToInt(_ stringValue: String?) -> Int {
        return Int(stringValue ?? "0") ?? 0
    }
}
