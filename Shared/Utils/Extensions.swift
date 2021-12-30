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
    
    var toString: String {
        var result: String = ""
        for element in self {
            result += "\(element), "
        }
        for _ in 0..<2 {
            result.removeLast()
        }
        return result
    }
}

extension Int {
    var duration: String {
        if self < 60 {
            return "\(self) minute\(self == 1 ? "" : "s")"
        }
        var suffix: String = ""
        let minutes: Int = self % 60
        if minutes == 0 {
            suffix = ""
        } else {
            suffix = ", \(minutes) minute\(minutes == 1 ? "" : "s")"
        }
        return "\(self / 60) hour\(self / 60 == 1 ? "" : "s")\(suffix)"
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
