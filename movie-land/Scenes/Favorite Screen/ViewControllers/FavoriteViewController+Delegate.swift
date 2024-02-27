//
//  FavoriteViewController+Delegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 27.02.2024.
//

import Foundation

extension FavoriteViewController: FavoriteViewModelDelegate {
    
    func didUpdate(_ data: [Search]) {
        if data.count > 0 {
            collectionView.isScrollEnabled = true
            collectionView.backgroundView = nil
        } else {
            let view = EmptyComponentView.loadFromNib()
            view.tag = AppViewTag.noFoundFavorite.rawValue
            view.frame = self.collectionView.frame
            view.descriptionLabel.text = Texts.FavoriteText.favorite
            view.imageView.image = Images.FavoritePageImages.savedIcon
            collectionView.isScrollEnabled = false
            collectionView.backgroundView = view
        }
        collectionView.reloadData()
    }
}
