//
//  SearchViewModel.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published private(set) var SearchResponses: [SearchResponse] = []
    private static let apiRequest = APISearchRequest()
    
    func search(searchText: String) {
        guard searchText != "" else {
            setSearchResponses([])
            return
        }
        guard let searchParameter: String = searchText.sanitized else { return }
        SearchViewModel.apiRequest.fetchData(searchParameter) { [weak self] SearchResponses in
            self?.setSearchResponses(SearchResponses)
        }
    }
    
    private func setSearchResponses(_ SearchResponses: [SearchResponse]) {
        DispatchQueue.main.async { [weak self] in
            self?.SearchResponses = SearchResponses
        }
    }
}
