//
//  StoryboardIdentifiable.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
