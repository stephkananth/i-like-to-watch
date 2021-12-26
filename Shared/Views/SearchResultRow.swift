//
//  SearchResultRow.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import SwiftUI

struct SearchResultRow: View {
    private let searchResult: SearchResult
    private static let width: CGFloat = UIScreen.main.bounds.width / 5
    
    var body: some View {
        HStack {
            AsyncImage(
                url: searchResult.getPosterURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: SearchResultRow.width, maxHeight: .greatestFiniteMagnitude)
                },
                placeholder: {
                    ProgressView()
                        .frame(width: SearchResultRow.width, height: SearchResultRow.width, alignment: .center)
                }
            )
            VStack(alignment: .leading) {
                Text(searchResult.getTitle)
                    .font(.headline)
                Text(searchResult.getYearString)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
    
    init(_ searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}
