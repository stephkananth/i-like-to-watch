//
//  Printable.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/30/21.
//

import Foundation

protocol Printable {
    func prettyPrint()
}

extension Printable {
    func prettyPrint() {
        for (_, element) in Mirror(reflecting: self).children.enumerated() {
            if let property_name = element.label as String? {
                print("\(property_name): \(element.value)")
            }
        }
    }
}

extension WatchItem: Printable { }
