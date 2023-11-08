//
//  MockMovieService.swift
//  MovieApp-ProtocolOrientedTests
//
//  Created by Kadirhan Keles on 7.11.2023.
//

import Foundation
@testable import MovieApp_ProtocolOriented

class MockMovieService: MovieService {
    var resultType: ResultTypesMock = .success
    
    private(set) var fetchMovieCallCount = 0
    private(set) var fetchMovieListMockResult = SearchList(
        search: [
            Search(title: "Spiderman", year: "2023", imdbID: "", type: .movie, poster: ""),
            Search(title: "Spiderman", year: "2022", imdbID: "", type: .movie, poster: "")
        ],
        totalResults: "2",
        response: "True"
    )
    
    private(set) var fetchMovieResult: Movie = Movie(title: "Batman")
    private(set) var searchMovieCallCount = 0
    private(set) var searchedMovie = ""
    
    func fetchMovie(
        movieId: String,
        completion: @escaping ((Result<MovieApp_ProtocolOriented.Movie, Error>) -> ())
    ) {
        fetchMovieCallCount += 1
        
        switch resultType {
        case .success:
            completion(.success(fetchMovieResult))
        case .failure:
            completion(.failure(MockMovieServiceError.unknown))
        }
    }
    
    func searchMovie(
        movieName: String,
        pageNumber: Int,
        completion: @escaping ((Result<MovieApp_ProtocolOriented.SearchList, Error>) -> ())
    ) {
        searchedMovie = movieName
        searchMovieCallCount += 1
        switch resultType {
        case .success:
            completion(.success(fetchMovieListMockResult))
        case .failure:
            completion(.failure(MockMovieServiceError.unknown))
        }
    }
}

enum MockMovieServiceError: Error {
    case unknown
}
