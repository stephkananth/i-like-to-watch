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
    var imdbID: String = ""
    var genres: [String] = []
    var posterData: Data? = nil
    var platform: Platform = .other
    var rating: Rating = .three
    var releaseDate: Date? = nil
    var runtime: Int? = nil
    var title: String = ""
    var type: MediaType? = .movie
    var watchDate: Date = Date()
    var yearStart: Int? = nil
    var yearEnd: Int? = nil
    
    var getImdbID: String {
        imdbID
    }
    
    var getGenres: [String] {
        genres
    }
    
    var getPosterData: Data? {
        posterData
    }
    
    var getPoster: Image {
        guard let posterData = posterData, let uiImage = UIImage(data: posterData) else { return Image(systemName: "sparkles.tv") }
        return Image(uiImage: uiImage)
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
    
    var getRuntime: Int? {
        runtime
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
    
    init() { }
    
    init(searchResponse: SearchResponse, detailedResponse: APIDetailedResponse, poster: URL?, platform: Platform, rating: Rating, watchDate: Date, season: Int?, episode: Int?) {
        self.imdbID = searchResponse.getImdbID
        self.posterData = poster?.imageData
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

extension WatchItem: Identifiable {
    var id: Int {
        imdbID.hashValue
    }
}
