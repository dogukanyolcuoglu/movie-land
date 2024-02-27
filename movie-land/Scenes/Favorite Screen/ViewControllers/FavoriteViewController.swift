//
//  FavoriteViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import UIKit
import Signals

class FavoriteViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var viewModel: FavoriteViewModel!
    var coordinator: FavoriteCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Texts.TabBarTitle.favorites
        collectionViewSetup()
        setup()
    }
    
    func setup() {
        viewModel.delegate = self
        viewModel.fetchDataFromCoreData()
        subscribeMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.isLoaded {
            viewModel.fetchDataFromCoreData()
        }
        viewModel.isLoaded = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        viewModel.coreManager.isSavedSucces.cancelSubscription(for: self)
    }
        
    func subscribeMethods() {
        viewModel.coreManager.isSavedSucces.subscribe(with: self) { [weak self] (success) in
            guard let self else { return }
            self.viewModel.fetchDataFromCoreData()
        }
    }
}
