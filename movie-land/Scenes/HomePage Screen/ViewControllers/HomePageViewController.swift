//
//  HomePageViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit
import Signals

class HomePageViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomePageViewModel!
    var coordinator: HomePageCoordinator!
    
    lazy var searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Texts.TabBarTitle.homePage
        collectionViewSetup()
        searchBarConfig()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    func searchBarConfig() {
        searchBar.delegate = self
        searchBar.placeholder = "Film ara..."
        searchBar.searchTextField.delegate = self
        self.navigationItem.titleView = searchBar
    }
    
    func setup() {
        viewModel.delegate = self
        defineSection([])
    }
    
    func configure() {
        self.noInternetSucject.subscribe(with: self) { [weak self] (data) in
            if data {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        noInternetSucject.cancelSubscription(for: self)
    }
    
    deinit {
        noInternetSucject.cancelSubscription(for: self)
    }
}

extension HomePageViewController: UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        viewModel.getSearchMovies(searchKey: textSearched)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        viewModel.getSearchMovies(searchKey: textField.text!)
        return true
    }
}
