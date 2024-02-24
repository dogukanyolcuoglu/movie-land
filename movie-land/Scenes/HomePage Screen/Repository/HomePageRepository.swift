//
//  HomePageRepository.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

final class HomePageRepository {
    
    func getHomeMovies(completion: @escaping (Result<HomeMoviesResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .getHomeMovies, completion: completion)
    }
    
    func getSearchMovies(searchKey: String, completion: @escaping (Result<SearchMoviesResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .searchByMovieNames(name: searchKey), completion: completion)
    }
}
