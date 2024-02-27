//
//  FavoriteCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import UIKit
import Signals

final class FavoriteCoordinator: Coordinator, UINavigationControllerDelegate {
    
    let rootViewController: TabBarController!
    let rootNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.tabBarItem = UITabBarItem(title: Texts.TabBarTitle.favorites, image: Images.Tabbar.bookMark, selectedImage: Images.Tabbar.bookMarkSelected)
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
    
    func goToMovieDetail(id: String) {
        let movieDetialCoordinator = MovieDetailCoordinator(rootViewController: rootNavigationController, movieID: id)
        movieDetialCoordinator.start()
    }
}
