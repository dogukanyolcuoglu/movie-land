//
//  MovieDetailCoordinator.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
    
    let storyboard = UIStoryboard(storyboard: .movieDetail)
    let rootNavigationViewController: UINavigationController!
    var viewModel: MovieDetailViewModel!
    
    init(rootViewController: UINavigationController, movieID: String) {
        self.rootNavigationViewController = rootViewController
        self.viewModel = MovieDetailViewModel(movieID: movieID, repository: MovieDetailRepository())
    }
    
    override func start() {
        let viewControoler: MovieDetailViewController = storyboard.instantiateViewController()
        viewControoler.viewModel = viewModel
        viewControoler.coordinator = self
        viewControoler.hidesBottomBarWhenPushed = true
        rootNavigationViewController.present(viewControoler, animated: true)
    }
    
}
