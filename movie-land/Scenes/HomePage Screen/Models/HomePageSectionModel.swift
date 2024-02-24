//
//  ListSection.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation

enum HomePageSectionModel: SectionModelType {
    case AllMoviesSection(title: String, items: [HomePageSectionModelItem])
    case SearchMoviesSection(items: [HomePageSectionModelItem])
    case EmptySection(items: [HomePageSectionModelItem])
    
    var items: [HomePageSectionModelItem] {
        switch  self {
        case .AllMoviesSection(_, let items):
            return items.map {$0}
        case .SearchMoviesSection(let items):
            return items.map {$0}
        case .EmptySection(let items):
            return items.map {$0}
        }
    }
    
    init(original: HomePageSectionModel, items: [Item]) {
        switch original {
        case .AllMoviesSection(let title, let items):
            self = .AllMoviesSection(title: title, items: items)
        case .SearchMoviesSection( let items):
            self = .SearchMoviesSection(items: items)
        case .EmptySection( let items):
            self = .EmptySection(items: items)
        }
    }
    
    typealias Item = HomePageSectionModelItem
}

enum HomePageSectionModelItem {
    case AllMoviesItem(data: HomeMovieItem)
    case SearchMoviesItem(data: HomeMovieItem)
    case EmptySectionItem
}
