//
//  TitleView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct TitleView: View {
    private let searchResult: SearchResult
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(searchResult.getTitle)
                    .font(.headline)
                Text(searchResult.getYearString)
                    .font(.subheadline)
            }
            Spacer()
            searchResult.getTypeIcon
        }
    }
    
    init(searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}
