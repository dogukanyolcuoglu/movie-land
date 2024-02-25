//
//  Texts.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation

struct Texts {
    
    struct Enviroment {
        static let baseURL = URL(string: "http://www.omdbapi.com")!
        static let apiKey = "a3b1fe3c"
    }
    
    struct TabBarTitle {
        static let homePage = "Anasayfa"
        static let favorites = "Favorilerim"
    }
    
    struct HomePageText {
        static let search = "İzlemek istediğin bir filmi arayabilirsin."
    }
    
    struct InternetConnection {
        static let message = "Bir şeyler ters gitti!\nLütfen internet bağlantı ayarlarınızı kontrol ediniz"
    }
}
