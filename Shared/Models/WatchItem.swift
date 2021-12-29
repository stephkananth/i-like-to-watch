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
    private let poster: Image?
    private let platform: Platform
    private let rating: Rating
    private let releaseDate: Date?
    private let title: String
    private let type: MediaType?
    private let watchDate: Date
    private let yearStart: Int?
    private let yearEnd: Int?
    
    init(searchResponse: SearchResponse, detailedResponse: APIDetailedResponse, id: Int, poster: Image?, platform: Platform, rating: Rating, watchDate: Date, season: Int?, episode: Int?) {
        self.id = id
        self.imdbID = searchResponse.getImdbID
        self.poster = poster
        self.platform = platform
        self.rating = rating
        self.releaseDate = detailedResponse.getReleaseDate
        if searchResponse.getType == .series, let season: Int = season, let episode: Int = episode {
            self.title = "\(searchResponse.getTitle): Season \(season), Episode \(episode)"
        } else {
            self.title = searchResponse.getTitle
        }
        self.type = searchResponse.getType
        self.watchDate = watchDate
        let yearString: String = searchResponse.getYearString
        print("*** @steph")
        print("yearString: \(yearString)")
        let years: [String] = yearString.components(separatedBy: "–")
        print("years: \(years)")
        if let yearStartString = years.first {
            self.yearStart = Int(yearStartString)
        } else {
            self.yearStart = nil
        }
        if years.count > 1, let yearEndString = years.last {
            self.yearEnd = Int(yearEndString)
        } else {
            self.yearEnd = nil
        }
    }
}
