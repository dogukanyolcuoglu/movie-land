//
//  HomePageViewController+Delegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import Foundation

extension HomePageViewController: HomePageViewModelDelegate {
    
    func updated(data: [Search]) {
        defineSection(data)
        collectionView.reloadData()
        LoadingView.shared.hideLoaderView()
    }
    
    func didFinishError() {
        defineSection([])
        collectionView.reloadData()
        LoadingView.shared.hideLoaderView()
    }
}

extension HomePageViewController {
    
    func defineSection(_ data: [Search]) {
        self.viewModel.sectionSubjects = []
        if data.count > 0 {
            collectionView.isScrollEnabled = true
            collectionView.backgroundView = nil
            self.viewModel.sectionSubjects?.append(.SearchMoviesSection(items: [.SearchMoviesItem(data: data)]))
        } else {
            let view = EmptyComponentView.loadFromNib()
            view.tag = AppViewTag.noFoundSearch.rawValue
            view.frame = self.collectionView.frame
            view.descriptionLabel.text = Texts.HomePageText.search
            view.imageView.image = Images.HomepageImages.searchIcon
            collectionView.isScrollEnabled = false
            collectionView.backgroundView = view
        }
    }
}
