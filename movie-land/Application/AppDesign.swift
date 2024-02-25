//
//  AppDesign.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit

struct AppDesign {
    static var window: UIWindow? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return keyWindow
    }
}
