//
//  APISearchRequest.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Foundation

class APISearchRequest: APIRequest {
    func fetchData(_ searchParameter: String, _ completionHandler: @escaping ([SearchResponse]) -> Void) {
        guard let request: URLRequest = formRequest(searchParameter) as URLRequest? else { return }
        let responseHandler: (Data?, URLResponse?, Error?) -> Void = { data, response, _ in
            guard let data: Data = data else { return }
            guard let apiResponse: APISearchResponse = try? JSONDecoder().decode(APISearchResponse.self, from: data) else { return }
            completionHandler(apiResponse.getSearchResponses)
        }
        URLSession.shared.dataTask(with: request, completionHandler: responseHandler).resume()
    }
    
    func formURLString(with searchParameter: String) -> String {
        "https://movie-database-imdb-alternative.p.rapidapi.com/?s=\(searchParameter)&r=json"
    }
}
