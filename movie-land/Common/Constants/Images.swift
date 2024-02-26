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
        static let person = UIImage(systemName: "star")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        static let personPageSelected = UIImage(systemName: "star.fill")?.withTintColor(Colors.TabBarColors.movieLandColor, renderingMode: .alwaysOriginal)
    }
    
    struct CommonImages {
        static let noInternet = UIImage(named: "noInternetIcon")
    }
    
    struct HomepageImages {
        static let searchIcon = UIImage(named: "searching")
    }
}
