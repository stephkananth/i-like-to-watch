//
//  SearchViewModel.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published private(set) var searchResults: [SearchResult] = []
    private static let apiRequest = APIRequest()
    
    func search(searchText: String) {
        guard searchText != "" else {
            setSearchResults([])
            return
        }
        guard let searchParameter: String = searchText.sanitized else { return }
        SearchViewModel.apiRequest.fetchData(searchParameter) { [weak self] searchResults in
            self?.setSearchResults(searchResults)
        }
    }
    
    private func setSearchResults(_ searchResults: [SearchResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.searchResults = searchResults
        }
    }
}
