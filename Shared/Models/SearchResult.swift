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
    
    var getType: MediaType? {
        return MediaType(rawValue: type)
    }
    
    var getTypeIcon: some View {
        getType?.icon
    }

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
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
