//
//  APISearchRequest.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Foundation

class APISearchRequest {
    func fetchData(_ searchParameter: String, _ completionHandler: @escaping ([SearchResponse]) -> Void) {
        guard let request: URLRequest = formRequest(searchParameter) as URLRequest? else { return }
        let responseHandler: (Data?, URLResponse?, Error?) -> Void = { data, response, _ in
            guard let data: Data = data else { return }
            guard let apiResponse: APISearchResponse = try? JSONDecoder().decode(APISearchResponse.self, from: data) else { return }
            completionHandler(apiResponse.getSearchResponses)
        }
        URLSession.shared.dataTask(with: request, completionHandler: responseHandler).resume()
    }
    
    private func formRequest(_ searchParameter: String) -> NSMutableURLRequest? {
        let urlString: String = "https://movie-database-imdb-alternative.p.rapidapi.com/?s=\(searchParameter)&r=json"
        guard let url: URL = NSURL(string: urlString) as URL? else { return nil }
        let headers: [String: String] = [
            "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com",
            "x-rapidapi-key": Keys.apiKey
        ]
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        request.timeoutInterval = 1
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
}
