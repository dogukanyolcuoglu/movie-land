//
//  FavoriteCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import UIKit

final class FavoriteCoordinator: Coordinator, UINavigationControllerDelegate {
    
    let rootViewController: TabBarController!
    let rootNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.tabBarItem = UITabBarItem(title: Texts.TabBarTitle.favorites, image: Images.Tabbar.person, selectedImage: Images.Tabbar.personPageSelected)
        let titleBoldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11, weight: .bold)
        ]
        navVC.tabBarItem.setTitleTextAttributes(titleBoldAttributes, for: .normal)
        return navVC
    }()
    let storyboard = UIStoryboard(storyboard: .favorite)
    let viewModel: FavoriteViewModel!
    
    init(rootViewController: TabBarController) {
        self.rootViewController = rootViewController
        self.viewModel = FavoriteViewModel(repository: FavoriteRepository())
    }
    
    override func start() {
        rootNavigationController.delegate = self
        let viewController: FavoriteViewController = storyboard.instantiateViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        rootNavigationController.setViewControllers([viewController], animated: false)
        rootViewController.viewControllers.add(element: rootNavigationController)
    }
}
