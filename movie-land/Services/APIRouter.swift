//
//  APIRouter.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import Moya

enum APIRouter {
    case getMovieById(stringId: String)
    case getHomeMovies
    case searchByMovieNames(name: String)
}

extension APIRouter: TargetType {
    
    var baseURL: URL {
        return Texts.Enviroment.baseURL
    }
    
    var path: String {
        switch self {
        case .getMovieById(let stringId):
            return "/movie/\(stringId)"
        case .getHomeMovies:
            return "/home"
        case .searchByMovieNames:
            return "/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieById, .getHomeMovies, .searchByMovieNames:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getHomeMovies:
            return [:]
        case .searchByMovieNames(let name):
            let params = ["query": name]
            return params
        case .getMovieById(let id):
            let params = ["id": id]
            return params
        }
    }
    
    var task: Task {
        switch self {
        case .getHomeMovies:
            return .requestPlain
        case .getMovieById, .searchByMovieNames:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
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
