//
//  APIDetailedRequest.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import Foundation

class APIDetailedRequest: APIRequest {
    func fetchData(_ searchParameter: String, _ completionHandler: @escaping (APIDetailedResponse) -> Void) {
        guard let request: URLRequest = formRequest(searchParameter) as URLRequest? else { return }
        let responseHandler: (Data?, URLResponse?, Error?) -> Void = { data, response, _ in
            guard let data: Data = data else { return }
            guard let apiResponse: APIDetailedResponse = try? JSONDecoder().decode(APIDetailedResponse.self, from: data) else { return }
            completionHandler(apiResponse)
        }
        URLSession.shared.dataTask(with: request, completionHandler: responseHandler).resume()
    }
    
    func formURLString(with searchParameter: String) -> String {
        "https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&i=\(searchParameter)"
    }
}
