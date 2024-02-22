//
//  MoviesResponse.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

// MARK: - MoviesResponse
struct MoviesResponse: Codable {
    let movies: [Movie]
    let page: Int
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int
    let backdropPath: String
    let genres: [String]
    let originalTitle, overview: String
    let posterPath: String
    let releaseDate, title: String
    let contentType: ContentType

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case backdropPath = "backdrop_path"
        case genres
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, contentType
    }
}
