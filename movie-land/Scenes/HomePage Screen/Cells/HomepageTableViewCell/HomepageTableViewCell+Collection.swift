//
//  HomepageTableViewCell+Collection.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation
import UIKit

extension HomepageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    internal func collectionViewSetup() {
        registerCell()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCell() {
        collectionView.register(cellType: HomepageCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sectionItems[indexPath.row] {
        case .AllMoviesItem(let data):
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomepageCollectionViewCell.self)
            cell.setup(data)
            return cell
        case .SearchMoviesItem(let data):
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomepageCollectionViewCell.self)
            cell.setup(data)
            return cell
        case .EmptySectionItem:
            return .init()
        }
    }
}

extension HomepageTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let perRow = 3.0
        let width = ((collectionView.bounds.size.width - 20 ) / perRow) - ((perRow - 1) * 5)
        return CGSize(width: isHorizontal ? 120 : width, height: 160)
    }
}
