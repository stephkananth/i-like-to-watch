//
//  SearchView.swift
//  Shared
//
//  Created by Steph Ananth on 12/24/21.
//

import SwiftUI
import CoreData

struct SearchView: View {    
    @ObservedObject private var viewModel: ViewModel = ViewModel()
    @State private var searchField: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("search", text: $searchField)
                    .padding(.leading)
                Button {
                    self.viewModel.search(searchText: self.searchField)
                } label: {
                    Label("", systemImage: "magnifyingglass")
                        .padding(.trailing)
                }
            }
            .padding(.bottom)
            List(viewModel.searchResults) { searchResult in
                NavigationLink(destination: SearchResultDetailView(searchResult)) {
                    SearchResultRow(searchResult)
                }
            }
        }
        .navigationTitle("search")
    }
}
