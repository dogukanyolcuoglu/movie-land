//
//  HomePageViewController+CollectionView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 25.02.2024.
//

import UIKit
import SnapKit

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        if viewModel.sectionSubjects?.count ?? 0 > 0 {
            let items = viewModel.sectionSubjects![section].items.first
            switch items {
            case .SearchMoviesItem(let data): return data.count
            default: return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let items = viewModel.sectionSubjects?[indexPath.section].items.first
        switch items {
        case .SearchMoviesItem(let data):
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomepageCollectionViewCell.self)
            cell.setup(data[indexPath.row])
            return cell
        default:
            return .init()
        }
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let perRow = 3.0
        let width = ((collectionView.bounds.size.width - 20 ) / perRow) - ((perRow - 1) * 5)
        return CGSize(width: width, height: 160)
    }
}
