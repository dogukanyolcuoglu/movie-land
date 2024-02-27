//
//  MovieDetailViewController+Delegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import Foundation

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    
    func loadPage(data: MovieDetailResponse) {
        setup(data)
    }
    
    func didFinishError() {
        LoadingView.shared.hideLoaderView()
    }
    
}
