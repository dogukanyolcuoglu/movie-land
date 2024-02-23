//
//  HomePageViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomePageViewModel!
    var coordinator: HomePageCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setup() {
        viewModel.delegate = self
        viewModel.getHomeMovies()
        viewModel.getMovies()
        viewModel.start()
    }
}
