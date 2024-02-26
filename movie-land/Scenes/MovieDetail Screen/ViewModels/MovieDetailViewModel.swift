//
//  MovieDetailViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import Foundation

protocol MovieDetailViewModelDelegate: AnyObject {
    func loadPage(data: MovieDetailResponse)
    func didFinishError()
}

final class MovieDetailViewModel: NSObject {
    
    var repository: MovieDetailRepository!
    weak var delegate: MovieDetailViewModelDelegate?
    var movieID: String!
    
    init(movieID: String, repository: MovieDetailRepository) {
        self.movieID = movieID
        self.repository = repository
        super.init()
        self.getMovieById()
    }
    
    func getMovieById() {
        repository.getMovieById(id: self.movieID) { [weak self] (result) in
            LoadingView.shared.showLoaderView()
            switch result {
            case .success(let response):
                self?.delegate?.loadPage(data: response)
            case .failure(let failure):
                self?.delegate?.didFinishError()
                print("error: \(failure.localizedDescription)")
            }
        }
    }
}
