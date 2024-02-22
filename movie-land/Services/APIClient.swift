//
//  APIClient.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit
import Moya

final class APIClient {
    
    var provider = MoyaProvider<APIRouter>()
    static var shared = APIClient()
    
    private var unauthorizedNotification = Foundation.Notification(name: .didReceive401)
    
    func request<T: Decodable>(target: APIRouter, completion: @escaping (Result<T, NetworkingError>) -> ()) {
        provider.request(target) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(request):
                let httpResponse = request.response
                self.handleResponseData(data: request.data, response: request.response, completion: completion)
            case let .failure(error):
                completion(.failure(NetworkingError.moyaError(error)))
            }
        }
    }
    
    private func handleResponseData<T: Decodable>(data: Data?, response: HTTPURLResponse?, completion: (Result<T, NetworkingError>) -> ()) {
        guard let response = response else {
            return completion(.failure(NetworkingError.noJSONData))
        }
        
        guard let data = data else {
            return completion(.failure(NetworkingError.unknown))
        }
        
        
        print("Request -> \(response.url!.absoluteString.utf8)")
        
        if let responseText = String(data: data, encoding: .utf8) {
            if responseText.count < 500000 {
                print("Response -> \(responseText) \n")
            }
        }

        switch response.statusCode {
        case 200...299:
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion(.success(results))
            } catch let error {
                completion(.failure(NetworkingError.decodingError(error)))
            }
        case 401:
            NotificationCenter.default.post(unauthorizedNotification)
        default:
            print("Error code: \(response.statusCode)")
            return completion(.failure(NetworkingError.unknown))
        }
    }
    
}
