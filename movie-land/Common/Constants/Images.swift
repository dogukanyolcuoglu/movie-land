//
//  Images.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

struct Images {
    
    struct Tabbar {
        static let homePage = UIImage(systemName: "play.house")?.withRenderingMode(.alwaysOriginal)
        static let homePageSelected = UIImage(systemName: "play.house.fill")?.withRenderingMode(.alwaysOriginal)
        static let bookMark = UIImage(systemName: "bookmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        static let bookMarkSelected = UIImage(systemName: "bookmark.fill")?.withTintColor(Colors.TabBarColors.movieLandColor, renderingMode: .alwaysOriginal)
    }
    
    struct CommonImages {
        static let noInternet = UIImage(named: "noInternetIcon")
    }
    
    struct HomepageImages {
        static let searchIcon = UIImage(named: "searching")
    }
    
    struct FavoritePageImages {
        static let savedIcon = UIImage(named: "savedIcon")
    }
}
