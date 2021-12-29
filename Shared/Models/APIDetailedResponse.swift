//
//  APIDetailedResponse.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import Foundation

struct APIDetailedResponse: Codable {
    private let metascore: String
    private let title: String
    private let awards: String
    private let director: String
    private let imdbRating: String
    private let response: String
    private let actors: String
    private let year: String
    private let plot: String
    private let imdbVotes: String
    private let type: String
    private let language: String
    private let rated: String
    private let runtime: String
    private let poster: String
    private let writer: String
    private let country: String
    private let ratings: [MovieRating]
    private let released: String
    private let imdbID: String
    private let totalSeasons: String
    private let genre: String
    
    var getReleaseDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.date(from: released)
    }
    
    enum CodingKeys: String, CodingKey {
        case metascore = "Metascore"
        case title = "Title"
        case awards = "Awards"
        case director = "Director"
        case imdbRating
        case response = "Response"
        case actors = "Actors"
        case year = "Year"
        case plot = "Plot"
        case imdbVotes
        case type = "Type"
        case language = "Language"
        case rated = "Rated"
        case runtime = "Runtime"
        case poster = "Poster"
        case writer = "Writer"
        case country = "Country"
        case ratings = "Ratings"
        case released = "Released"
        case imdbID, totalSeasons
        case genre = "Genre"
    }
}

struct MovieRating: Codable {
    let source, value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
