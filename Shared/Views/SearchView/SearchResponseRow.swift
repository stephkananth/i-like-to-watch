//
//  SearchResponseRow.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import SwiftUI

struct SearchResponseRow: View {
    private let SearchResponse: SearchResponse
    private static let width: CGFloat = Constants.width / 5
    
    var body: some View {
        HStack {
            AsyncImage(
                url: SearchResponse.getPosterURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: SearchResponseRow.width, maxHeight: .greatestFiniteMagnitude)
                },
                placeholder: {
                    ProgressView()
                        .frame(width: SearchResponseRow.width, height: SearchResponseRow.width, alignment: .center)
                }
            )
            VStack(alignment: .leading) {
                Text(SearchResponse.getTitle)
                    .font(.headline)
                Text(SearchResponse.getYearString)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
    
    init(_ SearchResponse: SearchResponse) {
        self.SearchResponse = SearchResponse
    }
}
