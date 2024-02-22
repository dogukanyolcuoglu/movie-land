//
//  APIRouter.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

enum APIRouter {
    case getMovies
    case getMovieById(stringId: String)
    case getHomeMovies
}

extension APIRouter: TargetType {
    
    var baseURL: URL {
        return Texts.Enviroment.baseURL
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movies"
        case .getMovieById(let stringId):
            return "/movie/\(stringId)"
        case .getHomeMovies:
            return "/home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies, .getMovieById, .getHomeMovies:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getMovies, .getMovieById, .getHomeMovies:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies, .getHomeMovies:
            return .requestPlain
        case .getMovieById:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let assigned: [String: String] = [
            "X-RapidAPI-Key" : Texts.Enviroment.apiKey,
            "X-RapidAPI-Host": Texts.Enviroment.host,
        ]
       return assigned
    }
    
}
