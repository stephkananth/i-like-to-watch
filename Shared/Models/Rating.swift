//
//  Rating.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/26/21.
//

import Foundation
import SwiftUI

enum Rating: String, CaseIterable {
    case one = "didn't like it"
    case two = "it was ok"
    case three = "liked it"
    case four = "really liked it"
    case five = "it was amazing"
    
    var intValue: Int {
        switch self {
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        }
    }
    
    var image: AnyView {
        switch self {
        case .one:
            return AnyView(HStack(alignment: .center) {
                Rating.filledCircle
                Rating.emptyCircle
                Rating.emptyCircle
                Rating.emptyCircle
                Rating.emptyCircle
            })
        case .two:
            return AnyView(HStack(alignment: .center) {
                Rating.filledCircle
                Rating.filledCircle
                Rating.emptyCircle
                Rating.emptyCircle
                Rating.emptyCircle
            })
        case .three:
            return AnyView(HStack(alignment: .center) {
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
                Rating.emptyCircle
                Rating.emptyCircle
            })
        case .four:
            return AnyView(HStack(alignment: .center) {
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
                Rating.emptyCircle
            })
        case .five:
            return AnyView(HStack(alignment: .center) {
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
                Rating.filledCircle
            })
        }
    }
    
    private static var emptyCircle: some View {
        Circle()
            .stroke(.blue)
            .frame(width: 10, height: 10, alignment: .center)
    }
    
    private static var filledCircle: some View {
        Circle()
            .fill(.blue)
            .frame(width: 10, height: 10, alignment: .center)
    }
    
    init?(intValue: Int) {
        switch intValue {
        case 1: self = .one
        case 2: self = .two
        case 3: self = .three
        case 4: self = .four
        case 5: self = .five
        default: return nil
        }
    }
}
