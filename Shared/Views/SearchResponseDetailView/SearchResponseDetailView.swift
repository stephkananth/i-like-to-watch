//
//  SearchResponseDetailView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct SearchResponseDetailView: View {
    @ObservedObject var persistenceVM = PersistenceViewModel()
    
    @State var platform: Platform = .netflix
    @State var rating: Rating = .three
    @State private var watchDate: Date = Date()
    @State var season: String = ""
    @State var episode: String = ""
    
    private let searchResponse: SearchResponse
    private let detailedRequest: APIDetailedRequest = APIDetailedRequest()
    
    var body: some View {
        VStack(alignment: .center) {
            PosterView(posterURL: searchResponse.getPosterURL)
            TitleView(SearchResponse: searchResponse)
            PlatformPicker(detailView: self)
            RatingPicker(detailView: self)
            DatePicker("date watched:", selection: $watchDate, displayedComponents: .date)
            
            if searchResponse.getType == .series {
                SeriesRow(detailView: self)
            }
            
            Spacer()
            Button("✨ add to watch history ✨") {
                detailedRequest.fetchData(searchResponse.getImdbID) { detailedResponse in
                    let watchItem: WatchItem = WatchItem(searchResponse: searchResponse, detailedResponse: detailedResponse, id: 0, poster: searchResponse.getPosterURL, platform: platform, rating: rating, watchDate: watchDate, season: Int(season), episode: Int(episode))
                    persistenceVM.saveItem(item: watchItem)
                }
            }
            Spacer()
        }
        .padding([.leading, .trailing])
    }
    
    init(_ SearchResponse: SearchResponse) {
        self.searchResponse = SearchResponse
    }
}
