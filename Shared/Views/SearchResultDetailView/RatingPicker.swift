//
//  RatingPicker.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct RatingPicker: View {
    private let detailView: SearchResultDetailView
    
    var body: some View {
        HStack(alignment: .center) {
            Text("rating:")
            Spacer()
            Picker("", selection: detailView.$rating) {
                ForEach(Rating.allCases.reversed(), id: \.self) { rating in
                    Text("\(rating.rawValue)")
                }
            }
            detailView.rating.image
        }
    }
    
    init(detailView: SearchResultDetailView) {
        self.detailView = detailView
    }
}
