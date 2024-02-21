//
//  AppCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Variables
    var window: UIWindow?
    let rootViewController: UIViewController = UIStoryboard(storyboard: .splash).instantiateInitialViewController()!
    var splashCoordinator: SplashCoordinator!
    
    //MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        self.splashCoordinator = SplashCoordinator(window: window)
        self.splashCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
    
    private func listen401Notification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceive401), name: .didReceive401, object: nil)
    }
    
    @objc private func didReceive401() {
        
    }
    
}
