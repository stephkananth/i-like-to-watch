//
//  SeriesRow.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct SeriesRow: View {
    private let detailView: SearchResultDetailView
    
    var body: some View {
        HStack(alignment: .center) {
            Text("season:")
                .frame(maxWidth: Constants.width / 5.75, alignment: .leading)
            TextField("season", text: detailView.$season)
                .frame(maxWidth: Constants.width / 5.75, alignment: .trailing)
            Spacer()
            Text("episode:")
                .frame(maxWidth: Constants.width / 5.75, alignment: .leading)
            TextField("episode", text: detailView.$episode)
                .frame(maxWidth: Constants.width / 5.75, alignment: .trailing)
        }
    }
    
    init(detailView: SearchResultDetailView) {
        self.detailView = detailView
    }
}
