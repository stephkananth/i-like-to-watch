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
    
    private var iconColor: Color {
        switch self {
        case .netflix: return .red
        case .hulu: return .green
        case .disney: return .indigo
        case .amazon: return .yellow
        case .theater: return .pink
        case .other: return .black
        }
    }
    
    var icon: some View {
        Text(abbreviation)
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .background(iconColor)
            .clipShape(Circle())
    }
}
