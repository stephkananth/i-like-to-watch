//
//  Platform.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import Foundation
import SwiftUI

enum Platform: String, CaseIterable {
    case netflix
    case hulu
    case disney
    case amazon
    case theater
    case other
    
    var intValue: Int {
        switch self {
        case .netflix: return 0
        case .hulu: return 1
        case .disney: return 2
        case .amazon: return 3
        case .theater: return 4
        case .other: return 5
        }
    }
    
    private var abbreviation: String {
        switch self {
        case .netflix: return "N"
        case .hulu: return "H"
        case .disney: return "D"
        case .amazon: return "A"
        case .theater: return "T"
        case .other: return "O"
        }
    }
    
    private var imageColor: Color {
        switch self {
        case .netflix: return .red
        case .hulu: return .green
        case .disney: return .indigo
        case .amazon: return .yellow
        case .theater: return .pink
        case .other: return .black
        }
    }
    
    var image: some View {
        Text(abbreviation)
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .background(imageColor)
            .clipShape(Circle())
    }
}
