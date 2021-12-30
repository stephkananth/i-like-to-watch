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

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        return formatter.string(from: self)
    }
}

extension String {
    var sanitized: String? {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}

extension URL {
    var imageData: Data? {
        guard let data: Data = try? Data(contentsOf: self) else { return nil }
        return UIImage(data: data)?.pngData()
    }
}
