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
    case searchByMovieNames(name: String)
}

extension APIRouter: TargetType {
    
    var baseURL: URL {
        return Texts.Enviroment.baseURL
    }
    
    var path: String {
        switch self {
        case .getMovieById, .searchByMovieNames:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieById, .searchByMovieNames:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchByMovieNames(let name):
            let params = [
                "apikey": Texts.Enviroment.apiKey,
                "s": name
            ]
            return params
        case .getMovieById(let id):
            let params = [
                "apikey": Texts.Enviroment.apiKey,
                "i": id
            ]
            return params
        }
    }
    
    var task: Task {
        switch self {
        case .getMovieById, .searchByMovieNames:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        let assigned: [String: String] = [:]
       return assigned
    }
    
}
