//
//  SearchResponse.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import Foundation
import SwiftUI

struct SearchResponse: Codable {
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
    
    var getImdbID: String {
        imdbID
    }
    
    var getType: MediaType? {
        return MediaType(rawValue: type)
    }
    
    var getTypeIcon: some View {
        getType?.icon
    }
    
    var getPosterURL: URL? {
        URL(string: poster)
    }

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

extension SearchResponse: Equatable {
    static func == (lhs: SearchResponse, rhs: SearchResponse) -> Bool {
        return lhs.imdbID == rhs.imdbID
    }
}

extension SearchResponse: Identifiable {
    var id: Int {
        return imdbID.hashValue
    }
}
