//
//  Webservice.swift
//  MovieApp-ProtocolOriented
//
//  Created by Kadirhan Keles on 5.11.2023.
//

import Foundation

protocol MovieService {
    func fetchMovie(movieId: String,completion: @escaping((Result<Movie,Error>) -> ()))
    func searchMovie(movieName: String, pageNumber: Int, completion: @escaping((Result<SearchList,Error>) -> () ))
}

class Webservice: MovieService {
    /*
    static let shared = Webservice()
    private init() { }
    */
    func fetchMovie(movieId: String,completion: @escaping((Result<Movie,Error>) -> ())) {
        let url = URL(string: "http://www.omdbapi.com/?apikey=c465e54c&i=\(movieId)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            } else if let data = data {
                let movie = try? JSONDecoder().decode(Movie.self, from: data)
                if let movie = movie {
                    completion(.success(movie))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
        
    }
    
    func searchMovie(movieName: String, pageNumber: Int, completion: @escaping((Result<SearchList,Error>) -> ())) {
        let url = URL(string: "https://www.omdbapi.com/?apikey=c465e54c&s=\(movieName)&page=\(pageNumber)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            } else if let data = data {
                let movieList = try? JSONDecoder().decode(SearchList.self, from: data)
                if let movieList = movieList {
                    completion(.success(movieList))

                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
}
