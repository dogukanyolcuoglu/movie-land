//
//  FavoriteViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import Foundation


final class FavoriteViewModel: NSObject {
    
    var repository: FavoriteRepository!
    
    init(repository: FavoriteRepository!) {
        self.repository = repository
    }
    
}
