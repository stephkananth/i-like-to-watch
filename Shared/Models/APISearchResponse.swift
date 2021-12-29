//
//  APIResponse.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Foundation

struct APISearchResponse: Codable {
    private let searchResponses: [SearchResponse]
    private let totalResults: String
    private let response: String
    
    var getSearchResponses: [SearchResponse] {
        searchResponses.unique
    }
    
    private enum CodingKeys: String, CodingKey {
        case searchResponses = "Search"
        case totalResults
        case response = "Response"
    }
}
