//
//  WatchItem.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/28/21.
//

import CoreData
import Foundation
import SwiftUI

class WatchItem {
    private let id: Int
    private let imdbID: String
    private let poster: Image
    private let platform: Platform
    private let rating: Rating
    private let title: String
    private let type: MediaType
    private let watchDate: Date
    private let yearEnd: Int
    private let yearStart: Int
    
    init(id: Int, imdbID: String, poster: Image, platform: Platform, rating: Rating, title: String, type: MediaType, watchDate: Date, yearEnd: Int, yearStart: Int) {
        self.id = id
        self.imdbID = imdbID
        self.poster = poster
        self.platform = platform
        self.rating = rating
        self.title = title
        self.type = type
        self.watchDate = watchDate
        self.yearEnd = yearEnd
        self.yearStart = yearStart
    }
}
