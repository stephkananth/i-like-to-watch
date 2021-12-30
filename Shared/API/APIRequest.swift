//
//  APIRequest.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/30/21.
//

import Foundation

protocol APIRequest {
    func formURLString(with searchParameter: String) -> String
    func formRequest(_ searchParameter: String) -> NSMutableURLRequest?
}

extension APIRequest {
    func formRequest(_ searchParameter: String) -> NSMutableURLRequest? {
        guard let url: URL = NSURL(string: formURLString(with: searchParameter)) as URL? else { return nil }
        let headers: [String: String] = [
            "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com",
            "x-rapidapi-key": Keys.apiKey
        ]
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        request.timeoutInterval = 10
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
}
