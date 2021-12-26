//
//  APIResponse.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Foundation

struct APIResponse: Codable {
    private let searchResults: [SearchResult]
    private let totalResults: String
    private let response: String
    
    var getSearchResults: [SearchResult] {
        searchResults.unique
    }
    
    private enum CodingKeys: String, CodingKey {
        case searchResults = "Search"
        case totalResults
        case response = "Response"
    }
}
