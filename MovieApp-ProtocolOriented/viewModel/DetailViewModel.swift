//
//  DetailViewModel.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 6.11.2023.
//

import Foundation

protocol DetailViewModelOutput {
    func updateView(movie: Movie)
}

class DetailViewModel {

    private let selectedMovieDetail: Movie?
    var output: DetailViewModelOutput?
    
    init(selectedMovieDetail: Movie?) {
        self.selectedMovieDetail = selectedMovieDetail
    }
    
    func dataTransfer() {
        self.output?.updateView(movie: selectedMovieDetail!)
    }
    
    func getFormattedRating(for movie: Movie) -> String {
        if movie.imdbRating == "N/A" {
            return "—"
        } else {
            return movie.imdbRating!
        }
    }
    
    func getFormattedReleaseDate(for movie: Movie) -> String {
        if movie.year == "N/A" {
            return "No information found"
        } else {
            return movie.year!
        }
    }
    
    func getFormattedDesc(for movie: Movie) -> String {
        if movie.plot == "N/A" {
            return "No description of this movie was found"
        } else {
            return movie.plot!
        }
    }
    
    func getFormattedGenre(for movie: Movie) -> String {
        if movie.genre == "N/A" {
            return "—"
        } else {
            return movie.genre!
        }
    }
    
    func getFormattedRuntime(for movie: Movie) -> String {
        if movie.runtime == "N/A" {
            return "—"
        } else {
            return movie.runtime!
        }
    }

    func getFormattedDirector(for movie: Movie) -> String {
        if movie.director == "N/A" {
            return "Director not found"
        } else {
            return movie.director!
        }
    }
    
    func getFormattedActors(for movie: Movie) -> String {
        if movie.actors == "N/A" {
            return "Actors not found"
        } else {
            return movie.actors!
        }
    }
}
