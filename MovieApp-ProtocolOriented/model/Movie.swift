// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie

struct Movie: Codable {
    let title, year, rated, released: String?
    let runtime, genre, director, writer: String?
    let actors, plot, language, country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]?
    let metascore, imdbRating, imdbVotes, imdbID: String?
    let type, dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}


extension Movie {
    init(title: String) {
        self.title = title
        self.year = nil
        self.rated = nil
        self.released = nil
        self.runtime = nil
        self.genre = nil
        self.director = nil
        self.writer = nil
        self.actors = nil
        self.plot = nil
        self.language = nil
        self.country = nil
        self.awards = nil
        self.poster = nil
        self.ratings = nil
        self.metascore = nil
        self.imdbRating = nil
        self.imdbVotes = nil
        self.imdbID = nil
        self.type = nil
        self.dvd = nil
        self.boxOffice = nil
        self.production = nil
        self.website = nil
        self.response = nil
    }
}

// MARK: - Rating

struct Rating: Codable {
    let source, value: String?

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

