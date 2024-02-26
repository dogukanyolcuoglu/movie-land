//
//  MovieDetailRepository.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import Foundation

final class MovieDetailRepository {
    
    func getMovieById(id: String, completion: @escaping (Result<MovieDetailResponse, NetworkingError>) -> ()) {
        APIClient.shared.request(target: .getMovieById(stringId: id), completion: completion)
    }
    
}
