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
    case getHomePageMovie
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
        case .getHomePageMovie:
            return "/home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies, .getMovieById, .getHomePageMovie:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getMovies, .getMovieById, .getHomePageMovie:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies, .getHomePageMovie:
            return .requestPlain
        case .getMovieById:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var assigned: [String: String] = [
            "X-RapidAPI-Key": Texts.Enviroment.apiKey,
            "X-RapidAPI-Host": Texts.Enviroment.urlString,
        ]
       return assigned
    }
    
}
