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

extension WatchItem {
    func prettyPrint() {
        let mirror = Mirror(reflecting: self)
        var retValue = [[String: Any]]()
        for (_, attr) in mirror.children.enumerated() {
            if let property_name = attr.label as String? {
                retValue.append([property_name: attr.value])
            }
        }
        print(retValue)
    }
}

extension String {
    var sanitized: String? {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
