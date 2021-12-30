//
//  ItemRow.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/30/21.
//

import SwiftUI

struct ItemRow: View {
    var item: WatchItem
    private static let width: CGFloat = Constants.width / 6
    
    var body: some View {
        HStack {
            item.getPoster.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: ItemRow.width, maxHeight: .greatestFiniteMagnitude)
            VStack(alignment: .leading) {
                Text(item.getTitle)
                    .font(.headline)
                Text(item.getWatchDate.toString)
                    .font(.subheadline)
                item.rating.image
            }
        }
    }
}
