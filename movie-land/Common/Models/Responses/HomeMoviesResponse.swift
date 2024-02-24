//
//  HomeMoviesResponse.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//


import Foundation

// MARK: - HomeMoviesResponseElement
struct HomeMoviesResponseData: Codable {
    let title: String?
    let movies: [HomeMovie]?
}

// MARK: - Movie
struct HomeMovie: Codable {
    let id: Int
    let backdropPath: String?
    let genres: [Genre]?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
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
        case title, contentType
        case firstAired = "first_aired"
    }
}

enum ContentType: String, Codable {
    case movie = "movie"
    case show = "show"
}

enum Genre: String, Codable {
    case actionAdventure = "Action & Adventure"
    case animation = "Animation"
    case comedy = "Comedy"
    case crime = "Crime"
    case documentary = "Documentary"
    case drama = "Drama"
    case family = "Family"
    case history = "History"
    case horror = "Horror"
    case music = "Music"
    case mystery = "Mystery"
    case realityTV = "Reality-TV"
    case romance = "Romance"
    case sciFiFantasy = "Sci-Fi & Fantasy"
    case thriller = "Thriller"
    case tvMovie = "TV Movie"
    case war = "War"
}

typealias HomeMoviesResponse = [HomeMoviesResponseData]
