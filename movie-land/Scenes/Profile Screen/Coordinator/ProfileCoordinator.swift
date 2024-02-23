//
//  ProfileCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import UIKit

final class ProfileCoordinator: Coordinator, UINavigationControllerDelegate {
    
    let rootViewController: TabBarController!
    let rootNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.tabBarItem = UITabBarItem(title: Texts.TabBarTitle.profile, image: Images.Tabbar.person, selectedImage: Images.Tabbar.personPageSelected)
        let titleBoldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11, weight: .bold)
        ]
        navVC.tabBarItem.setTitleTextAttributes(titleBoldAttributes, for: .normal)
        return navVC
    }()
    let storyboard = UIStoryboard(storyboard: .profile)
    let viewModel: ProfileViewModel!
    
    init(rootViewController: TabBarController) {
        self.rootViewController = rootViewController
        self.viewModel = ProfileViewModel(repository: ProfileRepository())
    }
    
    override func start() {
        rootNavigationController.delegate = self
        let viewController: ProfileViewController = storyboard.instantiateViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        rootNavigationController.setViewControllers([viewController], animated: false)
        rootViewController.viewControllers.add(element: rootNavigationController)
    }
}
