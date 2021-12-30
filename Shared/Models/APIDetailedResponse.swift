//
//  APIDetailedResponse.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import Foundation

struct APIDetailedResponse: Codable {
    private let title: String
    private let year: String
    private let plot: String
    private let type: String
    private let runtime: String
    private let poster: String
    private let released: String
    private let genre: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case type = "Type"
        case runtime = "Runtime"
        case poster = "Poster"
        case released = "Released"
        case genre = "Genre"
    }
    
    var getRuntime: Int? {
        return Int(runtime.trimmingCharacters(in: .decimalDigits.inverted))
    }
    
    var getReleaseDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.date(from: released)
    }
    
    var getGenres: [String] {
        genre.lowercased().components(separatedBy: ", ")
    }
}
