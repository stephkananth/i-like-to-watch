//
//  TitleView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct TitleView: View {
    private let searchResponse: SearchResponse
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(searchResponse.getTitle)
                    .font(.headline)
                Text(searchResponse.getYearString)
                    .font(.subheadline)
            }
            Spacer()
            searchResponse.getTypeIcon
        }
    }
    
    init(SearchResponse: SearchResponse) {
        self.searchResponse = SearchResponse
    }
}
