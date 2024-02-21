//
//  SplashCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

final class SplashCoordinator: Coordinator {
   
    let window: UIWindow!
    var tabBarCoordinator: TabbarCoordinator!
    let viewModel: SplashViewModel!

    init(window: UIWindow) {
        self.window = window
        viewModel = SplashViewModel(repository: SplashRepository())
    }
    
    override func start() {
        let rootviewController = window.rootViewController
        (rootviewController as! SplashViewController).viewModel = self.viewModel
        (rootviewController as! SplashViewController).coordinator = self
    }
    
    func goToDashBoardPage() {
        self.tabBarCoordinator = TabbarCoordinator(window: self.window)
        self.tabBarCoordinator.start()
    }
    
}
