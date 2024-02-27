//
//  MovieDetailCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import UIKit
import Signals

final class MovieDetailCoordinator: Coordinator {
    
    let storyboard = UIStoryboard(storyboard: .movieDetail)
    let rootNavigationViewController: UINavigationController!
    var viewModel: MovieDetailViewModel!
    
    init(rootViewController: UINavigationController, movieID: String) {
        self.rootNavigationViewController = rootViewController
        self.viewModel = MovieDetailViewModel(movieID: movieID, repository: MovieDetailRepository())
    }
    
    override func start() {
        let viewController: MovieDetailViewController = storyboard.instantiateViewController()
        viewController.viewModel = viewModel
        viewController.coordinator = self
        viewController.hidesBottomBarWhenPushed = true
        rootNavigationViewController.present(viewController, animated: false)
    }
    
}
