//
//  NetworkingError.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

enum NetworkingError: Error {
    case unknown
    case noJSONData
    case decodingError(Error)
    case moyaError(MoyaError)
}
