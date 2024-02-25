//
//  HomePageRepository.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

final class HomePageRepository {
    
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetailResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .getMovieById(stringId: id), completion: completion)
    }
    
    func getSearchMovies(searchKey: String, completion: @escaping (Result<SearchResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .searchByMovieNames(name: searchKey), completion: completion)
    }
}
