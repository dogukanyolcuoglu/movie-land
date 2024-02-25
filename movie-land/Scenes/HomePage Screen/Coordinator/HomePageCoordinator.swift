//
//  HomePageCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

class HomePageCoordinator: Coordinator, UINavigationControllerDelegate {
    
    let rootViewController: TabBarController!
    let rootNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.tabBarItem = UITabBarItem(title: Texts.TabBarTitle.homePage, image: Images.Tabbar.homePage, selectedImage: Images.Tabbar.homePageSelected)
        let titleBoldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11, weight: .bold)
        ]
        navVC.tabBarItem.setTitleTextAttributes(titleBoldAttributes, for: .normal)
        return navVC
    }()
    let viewModel: HomePageViewModel!
    let storyboard = UIStoryboard(storyboard: .homePage)

    init(rootViewController: TabBarController) {
        self.rootViewController = rootViewController
        viewModel = HomePageViewModel(repository: HomePageRepository())
    }
    
    override func start() {
        rootNavigationController.delegate = self
        let viewController: HomePageViewController = storyboard.instantiateViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        rootNavigationController.setViewControllers([viewController], animated: false)
        rootViewController.viewControllers.add(element: rootNavigationController)
    }
        
}
