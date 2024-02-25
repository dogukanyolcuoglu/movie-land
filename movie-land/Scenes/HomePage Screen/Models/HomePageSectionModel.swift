//
//  ListSection.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation

enum HomePageSectionModel: SectionModelType {
    case SearchMoviesSection(items: [HomePageSectionModelItem])
    
    var items: [HomePageSectionModelItem] {
        switch  self {
        case .SearchMoviesSection(let items):
            return items.map {$0}
        }
    }
    
    init(original: HomePageSectionModel, items: [Item]) {
        switch original {
        case .SearchMoviesSection( let items):
            self = .SearchMoviesSection(items: items)
        }
    }
    
    typealias Item = HomePageSectionModelItem
}

enum HomePageSectionModelItem {
    case SearchMoviesItem(data: [Search])
}
