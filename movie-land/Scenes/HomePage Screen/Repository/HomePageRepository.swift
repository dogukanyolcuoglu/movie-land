//
//  HomePageRepository.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

final class HomePageRepository {
    
    func getMovies(completion: @escaping (Result<MoviesResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .getMovies, completion: completion)
    }
    
    func getHomeMovies(completion: @escaping (Result<HomeMoviesResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .getHomeMovies, completion: completion)
    }
    
}
