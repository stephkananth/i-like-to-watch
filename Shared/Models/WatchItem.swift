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
    private let genres: [String]
    private let posterURL: URL?
    private let platform: Platform
    private let rating: Rating
    private let releaseDate: Date?
    private let runtime: Int?
    private let title: String
    private let type: MediaType?
    private let watchDate: Date
    private let yearStart: Int?
    private let yearEnd: Int?
    
    var getID: Int {
        id
    }
    
    var getImdbID: String {
        imdbID
    }
    
    var getGenres: [String] {
        genres
    }
    
    var getPosterData: Data? {
        guard let posterURL: URL = posterURL else { return nil }
        guard let data: Data = try? Data(contentsOf: posterURL) else { return nil }
        return UIImage(data: data)?.pngData()
    }
    
    var getPlatformID: Int {
        platform.intValue
    }
    
    var getRatingID: Int {
        rating.intValue
    }
    
    var getReleaseDate: Date? {
        releaseDate
    }
    
    var getTitle: String {
        title
    }
    
    var getMediaTypeID: Int? {
        type?.intValue
    }
    
    var getWatchDate: Date {
        watchDate
    }
    
    var getYearStart: Int? {
        yearStart
    }
    
    var getYearEnd: Int? {
        yearEnd
    }
    
    var getYears: String  {
        guard let yearStart = yearStart else { return "" }
        if type == .series {
            return "\(yearStart)-\(yearEnd != nil ? String(yearEnd!) : "")"
        } else {
            return String(yearStart)
        }
    }
    
    init(searchResponse: SearchResponse, detailedResponse: APIDetailedResponse, id: Int, poster: URL?, platform: Platform, rating: Rating, watchDate: Date, season: Int?, episode: Int?) {
        self.id = id
        self.imdbID = searchResponse.getImdbID
        self.posterURL = poster
        self.genres = detailedResponse.getGenres
        self.platform = platform
        self.rating = rating
        self.releaseDate = detailedResponse.getReleaseDate
        self.runtime = detailedResponse.getRuntime
        if searchResponse.getType == .series, let season: Int = season, let episode: Int = episode {
            self.title = "\(searchResponse.getTitle): Season \(season), Episode \(episode)"
        } else {
            self.title = searchResponse.getTitle
        }
        self.type = searchResponse.getType
        self.watchDate = watchDate
        let yearString: String = searchResponse.getYearString
        let years: [String] = yearString.components(separatedBy: "–")
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
