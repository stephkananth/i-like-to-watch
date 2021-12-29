//
//  SearchResultDetailView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct SearchResultDetailView: View {
    @State var platform: Platform = .netflix
    @State var rating: Rating = .three
    @State private var watchDate: Date = Date()
    @State var season: String = ""
    @State var episode: String = ""
    
    private let searchResult: SearchResult
    
    var body: some View {
        VStack(alignment: .center) {
            PosterView(posterURL: searchResult.getPosterURL)
            TitleView(searchResult: searchResult)
            PlatformPicker(detailView: self)
            RatingPicker(detailView: self)
            DatePicker("date watched:", selection: $watchDate, displayedComponents: .date)

            if searchResult.getType == .series {
                SeriesRow(detailView: self)
            }
            
            Spacer()
            Button("+ add to watch history +") {
                // do something
            }
            Spacer()
        }
        .padding([.leading, .trailing])
    }
    
    init(_ searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}
