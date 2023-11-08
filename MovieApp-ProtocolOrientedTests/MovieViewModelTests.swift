//
//  MovieViewModelTests.swift
//  MovieApp-ProtocolOrientedTests
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import XCTest
@testable import MovieApp_ProtocolOriented

final class MovieViewModelTests: XCTestCase {
    private var movieViewModel: HomeViewModel!
    private var movieService: MockMovieService!
    private var output: MockMovieViewModelOutput!
    
    override func setUp() {
        movieService = MockMovieService()
        movieViewModel = HomeViewModel(movieService: movieService)
        output = MockMovieViewModelOutput()
        movieViewModel.output = output
    }

    override func tearDown() {
        movieService = nil
        movieViewModel = nil
        output = nil
    }
    
    func test_view_is_notified_when_inital_movies_fetched_successfully() {
        // Given
        movieService.resultType = .success
        
        // When
        movieViewModel.fetchInitialMovies()
        
        // Then
        XCTAssertEqual(movieService.fetchMovieCallCount, 10)
        XCTAssertEqual(output.updateViewCallCount, 10)
    }
    
    func test_view_is_notified_when_inital_movies_failed() {
        // Given
        movieService.resultType = .failure
        
        // When
        movieViewModel.fetchInitialMovies()
        
        // Then
        XCTAssertEqual(movieService.fetchMovieCallCount, 10)
        XCTAssertEqual(output.updateViewCallCount, 0)
    }

    func test_service_notified_when_the_movie_searched() {
        // Given
        let searchText = "Spider man"
        
        // When
        movieViewModel.searchMovie(movieName: searchText)
        
        // Then
        XCTAssertEqual(movieService.searchedMovie, "Spider+man")
        XCTAssertEqual(movieService.searchMovieCallCount, 1)
    }
    
    func test_view_notified_when_search_movie_fetched_successfully() {
        // Given
        let searchText = "Batman"
        movieService.resultType = .success
        
        // When
        movieViewModel.searchMovie(movieName: searchText)
        
        // Then
        XCTAssertEqual(movieService.searchedMovie, "Batman")
        XCTAssertEqual(movieService.searchMovieCallCount, 1)
        XCTAssertEqual(output.hideMovieNotFoundViewCalled, true)
        XCTAssertEqual(movieService.fetchMovieCallCount, 2)
        XCTAssertEqual(output.updateViewCallCount, 2)
    }
    
    func test_view_notified_when_search_movie_failed() {
        // Given
        let searchText = "Batman"
        movieService.resultType = .failure
        
        // When
        movieViewModel.searchMovie(movieName: searchText)
        
        // Then
        XCTAssertEqual(movieService.searchedMovie, "Batman")
        XCTAssertEqual(movieService.searchMovieCallCount, 1)
        XCTAssertEqual(output.hideMovieNotFoundViewCalled, false)
        XCTAssertEqual(movieService.fetchMovieCallCount, 0)
        XCTAssertEqual(output.updateViewCallCount, 0)
    }
}
