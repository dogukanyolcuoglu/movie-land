//
//  HomePageViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation

final class HomePageViewModel: NSObject {
    
    var repository: HomePageRepository!
    
    init(repository: HomePageRepository) {
        self.repository = repository
    }
    
    
}
