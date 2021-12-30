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
        case .series: return 1
        case .game: return 2
        case .episode: return 3
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
    
    init?(intValue: Int) {
        switch intValue {
        case 0: self = .movie
        case 1: self = .series
        case 2: self = .game
        case 3: self = .episode
        default: return nil
        }
    }
}
