//
//  HomePageViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit
import Signals

class HomePageViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomePageViewModel!
    var coordinator: HomePageCoordinator!
    
    lazy var searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Texts.TabBarTitle.homePage
        tableViewConfigure()
        setupNavigationBar()
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
        searchBar.showsCancelButton = false
        searchBar.searchTextField.delegate = self
    }
    
    func setup() {
        viewModel.delegate = self
        viewModel.getHomeMovies()
    }
    
    func configure() {
        self.noInternetSucject.subscribe(with: self) { [weak self] (data) in
            if data {
                self?.tableView.reloadData()
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
    
    func setupNavigationBar() {
        self.navigationItem.titleView = nil
        let image = UIImage(systemName: "magnifyingglass")?.withTintColor(Colors.TabBarColors.heavyRedColor, renderingMode: .alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapSearchIcon))
    }
    
    @objc func didTapSearchIcon() {
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "iptal", style: .plain, target: self, action: #selector(hiddenSearchBar))
        self.navigationItem.rightBarButtonItem?.tintColor = Colors.TabBarColors.heavyRedColor
    }
    
    @objc func hiddenSearchBar() {
        self.title = Texts.TabBarTitle.homePage
        self.navigationItem.titleView = nil
        self.searchBar.searchTextField.text = nil
        setupNavigationBar()
        viewModel.getHomeMovies()
    }
}

extension HomePageViewController: UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if textSearched.count >= 3 {
            viewModel.getSearchMovies(searchKey: textSearched)
        } else if textSearched.count == 0 {
            viewModel.getHomeMovies()
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        viewModel.getHomeMovies()
        return true
    }
}
