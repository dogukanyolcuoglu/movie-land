//
//  SplashViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation

final class SplashViewModel: NSObject {
    
    var repository: SplashRepository!
    
    init(repository: SplashRepository) {
        self.repository = repository
    }
    
}
