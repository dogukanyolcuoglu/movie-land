//
//  HomePageViewController+Delegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import Foundation

extension HomePageViewController: HomePageViewModelDelegate {
    
    func getMoviesData(data: MoviesResponse) {
        print("Success movies data")
    }
    
    func getHomeMoviesData(data: HomeMoviesResponse) {
        print("Success home movies data")
    }
    
    func didLoad() {
        
    }
    
}
