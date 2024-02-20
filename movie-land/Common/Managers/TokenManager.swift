//
//  TokenManager.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import KeychainAccess

struct TokenManager {
        
    private var keychain: Keychain? = Keychain(server: "com.yolcuogludogukan.movie-land-token-encrypt", protocolType: .https)
    
    fileprivate let accessToken = "accessToken"
    fileprivate let refreshToken = "refreshToken"
    
    static func getAccessToken() -> String? {
        return TokenManager().keychain![TokenManager().accessToken]
    }
    
    static func getRefreshToken() -> String? {
        return TokenManager().keychain![TokenManager().refreshToken]
    }
    
    
    static func saveAuthenticationTokens(accessToken: String, refreshToken: String) {
        
        do {
            try TokenManager().keychain!.set(accessToken, key: TokenManager().accessToken)
            try TokenManager().keychain!.set(refreshToken, key: TokenManager().refreshToken)
        }
        catch let error {
            print(error)
        }
        
    }
    
    static func removeAuthenticationTokens() {
        do {
            try TokenManager().keychain?.removeAll()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
