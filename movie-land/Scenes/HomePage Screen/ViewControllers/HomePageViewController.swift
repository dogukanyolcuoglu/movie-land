//
//  HomePageViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation

class HomePageViewController: BaseViewController {
    
    var viewModel: HomePageViewModel!
    var coordinator: HomePageCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setup() {
        viewModel.delegate = self
        viewModel.getMovies()
        viewModel.getHomeMovies()
    }
}
