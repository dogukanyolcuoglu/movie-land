//
//  HomePageViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

protocol HomePageViewModelDelegate: AnyObject {
    func updated()
}

final class HomePageViewModel: NSObject {
    
    var repository: HomePageRepository!
    weak var delegate: HomePageViewModelDelegate?
    private var dispatchGroup = DispatchGroup()
    var sections = [ListSection]()
    
    init(repository: HomePageRepository) {
        self.repository = repository
    }
    
    func start() {
        dispatchGroup.notify(queue: .main) {
            self.sections = self.sections.sorted { lhs, rhs in
                return lhs.priority < rhs.priority
            }
            self.delegate?.updated()
        }
    }
    
    func getMovies() {
        dispatchGroup.enter()
        repository.getMovies { [weak self] (result) in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let response):
                let items = response.movies.map({ ListItem(title: $0.originalTitle, releaseDate: $0.releaseDate, image: $0.backdropPath)})
                self?.sections.append(.allMovies(items: items))
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func getHomeMovies() {
        self.dispatchGroup.enter()
        repository.getHomeMovies { [weak self] (result) in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let response):
                let firstItem = response.first(where: { $0.title.uppercased() == "Trending Movies".uppercased() })
                let items = firstItem?.movies.map({ ListItem(title: $0.originalTitle, releaseDate: $0.releaseDate ?? "", image: $0.backdropPath)}).prefix(10)
                self?.sections.append(.topMovies(items: Array(items ?? [])))
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
