//
//  PosterView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct PosterView: View {
    private var detailView: SearchResponseDetailView? = nil
    private var url: URL? = nil
    private static let height = Constants.height / 3
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: PosterView.height)
                .shadow(radius: PosterView.height / 12)
                .onAppear {
                    self.detailView?.image = image
                }
                .onDisappear {
                    self.detailView?.image = image
                }
        } placeholder: {
            ProgressView()
                .frame(width: PosterView.height, height: PosterView.height, alignment: .center)
        }
    }
    
    init(detailView: SearchResponseDetailView, posterURL: URL?) {
        self.detailView = detailView
        self.url = posterURL
    }
}
