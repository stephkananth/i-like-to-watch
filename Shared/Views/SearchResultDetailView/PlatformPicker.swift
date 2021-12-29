//
//  PlatformPicker.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import SwiftUI

struct PlatformPicker: View {
    private let detailView: SearchResultDetailView
    
    var body: some View {
        HStack(alignment: .center) {
            Text("platform:")
            Spacer()
            Picker("", selection: detailView.$platform) {
                ForEach(Platform.allCases.reversed(), id: \.self) { platform in
                    Text(platform.rawValue)
                }
            }
            detailView.platform.image
        }
    }
    
    init(detailView: SearchResultDetailView) {
        self.detailView = detailView
    }
}
