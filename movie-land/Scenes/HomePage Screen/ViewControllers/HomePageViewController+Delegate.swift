//
//  HomePageViewController+Delegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 22.02.2024.
//

import Foundation

extension HomePageViewController: HomePageViewModelDelegate {
    
    func updated() {
        collectionView.reloadData()
        print("updated ...")
    }
    
}
