//
//  SearchResponseDetailView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import SwiftUI

struct SearchResponseDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var persistenceVM: PersistenceViewModel
    
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
                if searchResponse.getType == .series {
                    guard season != "" && episode != "" else {
                        return
                    }
                }
                detailedRequest.fetchData(searchResponse.getImdbID) { detailedResponse in
                    let watchItem: WatchItem = WatchItem(searchResponse: searchResponse, detailedResponse: detailedResponse, poster: searchResponse.getPosterURL, platform: platform, rating: rating, watchDate: watchDate, season: Int(season), episode: Int(episode))
                    persistenceVM.saveItem(item: watchItem)
                    DispatchQueue.main.async {
                        self.mode.wrappedValue.dismiss()
                    }
                }
            }.disabled(searchResponse.getType == .series && (season == "" || episode == ""))
            Spacer()
        }
        .padding([.leading, .trailing])
    }
    
    init(_ SearchResponse: SearchResponse, persistenceVM: PersistenceViewModel) {
        self.searchResponse = SearchResponse
        self.persistenceVM = persistenceVM
    }
}
