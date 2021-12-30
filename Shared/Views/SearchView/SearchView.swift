//
//  SearchView.swift
//  Shared
//
//  Created by Steph Ananth on 12/24/21.
//

import SwiftUI
import CoreData

struct SearchView: View {    
    @ObservedObject private var searchVM: SearchViewModel = SearchViewModel()
    @State private var searchField: String = ""
    var persistenceVM: PersistenceViewModel
    
    var body: some View {
        VStack {
            HStack {
                TextField("search", text: $searchField)
                    .padding(.leading)
                Button {
                    self.searchVM.search(searchText: self.searchField)
                } label: {
                    Label("", systemImage: "magnifyingglass")
                        .padding(.trailing)
                }
            }
            .padding(.bottom)
            List(searchVM.SearchResponses) { SearchResponse in
                NavigationLink(destination: SearchResponseDetailView(SearchResponse, persistenceVM: persistenceVM)) {
                    SearchResponseRow(SearchResponse)
                }
            }
        }
        .navigationTitle("search")
    }
}
