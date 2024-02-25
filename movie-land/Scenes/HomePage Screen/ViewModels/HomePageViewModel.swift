//
//  HomePageViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

protocol HomePageViewModelDelegate: AnyObject {
    func updated(data: [Search])
    func didFinishError()
}

final class HomePageViewModel: NSObject {
    
    private var repository: HomePageRepository!
    weak var delegate: HomePageViewModelDelegate?
    var sectionSubjects: Array<HomePageSectionModel>?
    
    init(repository: HomePageRepository) {
        self.repository = repository
        super.init()
    }
    
    func getSearchMovies(searchKey: String) {
        repository.getSearchMovies(searchKey: searchKey) { [weak self] (result) in
            LoadingView.shared.showLoaderView()
            switch result {
            case .success(let response):
                self?.delegate?.updated(data: response.search ?? [])
            case .failure(let error):
                self?.delegate?.didFinishError()
                print("error: \(error)")
            }
        }
    }
}
