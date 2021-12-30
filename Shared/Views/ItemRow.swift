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
                Text(item.title)
                    .font(.subheadline)
                Text(item.watchDate.toString)
                    .font(.caption)
                    .foregroundColor(.gray)
                item.rating.image
            }
        }
    }
}
