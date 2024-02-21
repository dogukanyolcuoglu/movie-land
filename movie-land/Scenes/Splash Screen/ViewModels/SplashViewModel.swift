//
//  SplashViewModel.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import FirebaseRemoteConfig

final class SplashViewModel: NSObject {
    
    var repository: SplashRepository!
    private let remoteConfig = RemoteConfig.remoteConfig()
    private let remoteConfigSettings = RemoteConfigSettings()
    
    init(repository: SplashRepository) {
        self.repository = repository
    }
    
    func firebaseConfig(_ completion: @escaping (String) -> ()) {
        remoteConfigSettings.minimumFetchInterval = 0.1
        remoteConfig.configSettings = remoteConfigSettings
        
        remoteConfig.fetchAndActivate { (stauts, error) in
            if let error = error {
                print("error: \(error)")
            }
            
            let str = self.remoteConfig.configValue(forKey: "companyName").stringValue ?? ""
            completion(str)
        }
    }
}
