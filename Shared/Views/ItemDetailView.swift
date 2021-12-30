//
//  ItemDetailView.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/30/21.
//

import SwiftUI

struct ItemDetailView: View {
    var item: WatchItem
    private static let height = Constants.height / 2
    
    var body: some View {
        VStack(alignment: .center) {
            item.getPoster
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: ItemDetailView.height)
                .shadow(radius: ItemDetailView.height / 12)
                .padding(.bottom)
            Text(item.title)
                .font(.headline)
                .fontWeight(.light)
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("release:\t\(item.releaseDate?.toString ?? "") \(item.type == .series ? "| \(item.getYears)" : "")")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("genre\(item.genres.count != 1 ? "s" : ""):\t\(item.genres.toString)")
                        .font(.caption)
                        .fontWeight(.light)
                    Text("runtime:\t\(item.runtime?.duration ?? "")")
                        .font(.caption)
                        .fontWeight(.light)
                }
                Spacer()
                item.platform.image
                Spacer()
            }
            Spacer()
            VStack {
                Text(item.watchDate.toString)
                    .font(.caption)
                    .fontWeight(.light)
                HStack(alignment: .center) {
                    Text("rating:")
                        .font(.caption)
                        .fontWeight(.light)
                    item.rating.image
                }
            }
            Spacer()
            Spacer()
        }
        .padding([.leading, .trailing])
    }
}
