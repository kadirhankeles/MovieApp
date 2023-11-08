//
//  MockMovieViewModelOutput.swift
//  MovieApp-ProtocolOrientedTests
//
//  Created by Kadirhan Keles on 7.11.2023.
//

import Foundation
@testable import MovieApp_ProtocolOriented

class MockMovieViewModelOutput: HomeViewModelOutput {
    private(set) var updateViewCallCount = 0
    private(set) var updateSearchViewCallCount = 0
    private(set) var showMovieNotFoundViewCalled = false
    private(set) var hideMovieNotFoundViewCalled = false
    private(set) var scrollToFirstItemCallCount = 0
    private(set) var updateMovieList: SearchList?
    private(set) var updateMovie: [Movie]?
    
    func updateView(movieList: [MovieApp_ProtocolOriented.Movie]) {
        updateViewCallCount += 1
        updateMovie = movieList
    }
    
    func updateSearchView(movieList: MovieApp_ProtocolOriented.SearchList) {
        updateMovieList = movieList
    }
    
    func showMovieNotFoundView() {
        showMovieNotFoundViewCalled = true
    }

    func hideMovieNotFoundView() {
        hideMovieNotFoundViewCalled = true
    }

    func scrollToFirstItem() {
        scrollToFirstItemCallCount += 1
    }
}
