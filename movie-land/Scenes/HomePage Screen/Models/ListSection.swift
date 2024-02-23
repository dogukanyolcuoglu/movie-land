//
//  ListSection.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation

enum ListSection {
    case topMovies(items: [ListItem])
    case allMovies(items: [ListItem])
    
    var items: [ListItem] {
        switch self {
        case .topMovies(let items), .allMovies(let items):
            return items
        }
    }
    
    var priority: Int {
        switch self {
        case .topMovies:
            return 1
        case .allMovies:
            return 2
        }
    }
    
    var title: String {
        switch self {
        case .topMovies:
            return "Trend Filmler"
        case .allMovies:
            return "Tüm Filmler"
        }
    }
}
