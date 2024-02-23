//
//  Texts.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation

struct Texts {
    
    struct Enviroment {
        static let baseURL = URL(string: "https://movies-api14.p.rapidapi.com")!
        static let apiKey = "3df9510d5emsh02b60408a2e095bp1e4444jsn30ebc32c0cf8"
        static let host = "movies-api14.p.rapidapi.com"
    }
    
    struct TabBarTitle {
        static let homePage = "Anasayfa"
        static let profile = "Profil"
    }
    
    struct InternetConnection {
        static let title = "Bağlantı Hatası"
        static let message = "Lütfen internet bağlantını kontrol et"
    }
}
