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
    func didFinishError()
}

final class HomePageViewModel: NSObject {
    
    private var repository: HomePageRepository!
    weak var delegate: HomePageViewModelDelegate?
    var sections = [HomePageSectionModel]()
    
    init(repository: HomePageRepository) {
        self.repository = repository
    }

    func getHomeMovies() {
        LoadingView.shared.showLoaderView()
        repository.getHomeMovies { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sections = []
                self?.sections = self?.homeMoviesItems(response) ?? []
                self?.delegate?.updated()
            case .failure(let error):
                self?.delegate?.didFinishError()
                self?.sections = []
                print("error: \(error)")
            }
        }
    }
    
    func getSearchMovies(searchKey: String) {
        repository.getSearchMovies(searchKey: searchKey) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sections = []
                self?.sections = self?.searchMoviesItems(response.contents ?? []) ?? []
                self?.delegate?.updated()
            case .failure(let error):
                self?.delegate?.didFinishError()
                self?.sections = [.EmptySection(items: [.EmptySectionItem])]
                print("error: \(error)")
            }
        }
    }
    
    func homeMoviesItems(_ data: [HomeMoviesResponseData]) -> [HomePageSectionModel] {
        var sections = [HomePageSectionModel]()
        data.forEach { (responseData) in
            var items = [HomePageSectionModelItem]()
            responseData.movies?.forEach({ (movie) in
                items.append(.AllMoviesItem(data: HomeMovieItem(id: movie.id, image: movie.backdropPath ?? "")))
            })
            sections.append(.AllMoviesSection(title: responseData.title ?? "", items: items))
        }
        return sections
    }
    
    func searchMoviesItems(_ data: [SearchContent]) -> [HomePageSectionModel] {
        var section = [HomePageSectionModel]()
        var items = [HomePageSectionModelItem]()
        data.forEach { (content) in
            items.append(.SearchMoviesItem(data: HomeMovieItem(id: content.id, image: content.backdropPath ?? "")))
        }
        section.append(.SearchMoviesSection(items: items))
        return section
    }
}
