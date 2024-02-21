//
//  TabBarCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

enum Tab: Int {
    case homePage
    case profile
}

class TabbarCoordinator: Coordinator {
    
    unowned var window: UIWindow?
    
    let tabbarController: TabBarController
    
    // MARK:- Coordinators
    lazy var homePageCoordinator = HomePageCoordinator(rootViewController: tabbarController)
    
    init(window: UIWindow) {
        self.window = window
        self.tabbarController = TabBarController()
    }
    
    override func start() {
        tabbarController.coordinator = self
        homePageCoordinator.start()
        switchRoot()
    }
    
    private func setSelectedTab(_ tab: Tab) {

    }
    
    private func popToRootViewController(_ tab: Tab) {

    }
    
    @objc private func switchRoot() {
        window?.switchRootViewController(rootViewController: tabbarController, animated: true, completion: nil)
    }
}
