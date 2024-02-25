//
//  UIStoryboard+Storyboards.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case splash
        case favorite
        case homePage
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    
    // MARK: - Convenience Initializers
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    
    // MARK: - View Controller Instantiation from Generics
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}

extension UIViewController: StoryboardIdentifiable { }
