//
//  APIDetailedRequest.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import Foundation

class APIDetailedRequest {
    func fetchData(_ searchParameter: String, _ completionHandler: @escaping (APIDetailedResponse) -> Void) {
        guard let request: URLRequest = formRequest(searchParameter) as URLRequest? else { return }
        let responseHandler: (Data?, URLResponse?, Error?) -> Void = { data, response, _ in
            guard let data: Data = data else { return }
            guard let apiResponse: APIDetailedResponse = try? JSONDecoder().decode(APIDetailedResponse.self, from: data) else { return }
            completionHandler(apiResponse)
        }
        URLSession.shared.dataTask(with: request, completionHandler: responseHandler).resume()
    }
    
    private func formRequest(_ searchParameter: String) -> NSMutableURLRequest? {
        let urlString: String = "https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&i=\(searchParameter)"
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
