//
//  SearchResult.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import Foundation
import SwiftUI

struct SearchResult: Codable {
    private let title: String
    private let year: String
    private let imdbID: String
    private let type: String
    private let poster: String
    
    var getTitle: String {
        title
    }
    
    var getYearString: String {
        year
    }
    
    var getPosterURL: URL? {
        URL(string: poster)
    }
    
    var getType: String {
        type
    }
    
    var getTypeIcon: some View {
        MediaType(rawValue: type)?.icon
    }

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
    
    private enum MediaType: String {
        case movie
        case series
        case game
        case episode
        
        private var abbreviation: String {
            switch self {
            case .movie: return "M"
            case .series: return "TV"
            case .game: return "G"
            case .episode: return "EP"
            }
        }
        
        var icon: some View {
            Text(abbreviation)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(.gray)
                .clipShape(Circle())
        }
    }
}

extension SearchResult: Equatable {
    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        return lhs.imdbID == rhs.imdbID
    }
}

extension SearchResult: Identifiable {
    var id: Int {
        return imdbID.hashValue
    }
}
