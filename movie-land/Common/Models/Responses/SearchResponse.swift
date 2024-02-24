//
//  SearchResponse.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 24.02.2024.
//

import Foundation

// MARK: - SearchMoviesResponse
struct SearchMoviesResponse: Codable {
    let query: String?
    let contents: [SearchContent]?
}

// MARK: - Content
struct SearchContent: Codable {
    let id: Int
    let backdropPath: String?
    let genres: [String]?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    let voteCount: Int?
    let youtubeTrailer: String?
    let sources: [Source]?
    let contentType: ContentType?
    let firstAired: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case backdropPath = "backdrop_path"
        case genres
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case youtubeTrailer = "youtube_trailer"
        case sources, contentType
        case firstAired = "first_aired"
    }
}

// MARK: - Source
struct Source: Codable {
    let source: String?
    let link: String?
    let type: TypeEnum?
    let displayName: String?
    let info: String?
    let platform: Platform?

    enum CodingKeys: String, CodingKey {
        case source, link, type
        case displayName = "display_name"
        case info, platform
    }
}

// MARK: - Platform
struct Platform: Codable {
    let android: String?
    let androidTv: String?
    let ios, web: String?

    enum CodingKeys: String, CodingKey {
        case android
        case androidTv = "android_tv"
        case ios, web
    }
}

enum TypeEnum: String, Codable {
    case free = "free"
    case purchase = "purchase"
    case subscription = "subscription"
}
