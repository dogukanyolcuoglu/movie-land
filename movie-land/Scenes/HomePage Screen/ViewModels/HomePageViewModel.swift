//
//  HomePageViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

protocol HomePageViewModelDelegate: AnyObject {
    func getMoviesData(data: MoviesResponse)
    func getHomeMoviesData(data: HomeMoviesResponse)
    func didLoad()
}

final class HomePageViewModel: NSObject {
    
    var repository: HomePageRepository!
    weak var delegate: HomePageViewModelDelegate?
    private var dispatchGroup = DispatchGroup()
    
    init(repository: HomePageRepository) {
        self.repository = repository
    }
    
    func start() {
        dispatchGroup.notify(queue: .main) {
            self.delegate?.didLoad()
        }
    }
    
    func getMovies() {
        dispatchGroup.enter()
        repository.getMovies { [weak self] (result) in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let response):
                self?.delegate?.getMoviesData(data: response)
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
                self?.delegate?.getHomeMoviesData(data: response)
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
