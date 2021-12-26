//
//  SearchResultDetailView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct SearchResultDetailView: View {
    @State private var watchDate: Date = Date()
    @State private var platform: Platform = .netflix
    @State private var rating: Rating = .three
    
    private let searchResult: SearchResult
    private static let height: CGFloat = UIScreen.main.bounds.height / 3
    
    var body: some View {
        VStack {
            AsyncImage(url: searchResult.getPosterURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: SearchResultDetailView.height)
                    .shadow(radius: SearchResultDetailView.height / 12)
            } placeholder: {
                ProgressView()
                    .frame(width: SearchResultDetailView.height, height: SearchResultDetailView.height, alignment: .center)
            }.padding(.bottom)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(searchResult.getTitle)
                        .font(.headline)
                    Text(searchResult.getYearString)
                        .font(.subheadline)
                }.padding(.leading)
                Spacer()
                searchResult.getTypeIcon
                    .padding(.trailing)
            }
            HStack(alignment: .center) {
                Text("platform:")
                    .padding(.leading)
                Spacer()
                Picker("", selection: $platform) {
                    ForEach(Platform.allCases.reversed(), id: \.self) { platform in
                        Text(platform.rawValue)
                    }
                }
                Spacer()
                platform.icon
                    .padding(.trailing)
                
            }
            Spacer()
            HStack(alignment: .center) {
                Text("rating:")
                    .padding(.leading)
                Spacer()
                Picker("", selection: $rating) {
                    ForEach(Rating.allCases.reversed(), id: \.self) { rating in
                        Text("\(rating.rawValue)")
                    }
                }
                Spacer()
                rating.image
                    .padding(.trailing)
                
            }
            Spacer()
            DatePicker("date watched:", selection: $watchDate, displayedComponents: .date)
                .padding([.leading, .trailing])
            Spacer()
            Button("add to history") {
                // do something
            }
            Spacer()
        }
    }
    
    init(_ searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}
