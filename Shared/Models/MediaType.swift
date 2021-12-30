//
//  MediaType.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import Foundation
import SwiftUI

enum MediaType: String {
    case movie
    case series
    case game
    case episode
    
    var intValue: Int {
        switch self {
        case .movie: return 0
        case .series: return 0
        case .game: return 0
        case .episode: return 0
        }
    }
    
    private var abbreviation: String {
        switch self {
        case .movie: return "M"
        case .series: return "TV"
        case .game: return "G"
        case .episode: return "EP"
        }
    }
    
    var icon: some View {
        Text(abbreviation)
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .background(.gray)
            .clipShape(Circle())
    }
}
