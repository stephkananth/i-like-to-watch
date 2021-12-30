//
//  Extensions.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/24/21.
//

import Foundation
import UIKit

extension Array where Element: Equatable {
    var unique: [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
}

extension String {
    var sanitized: String? {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
