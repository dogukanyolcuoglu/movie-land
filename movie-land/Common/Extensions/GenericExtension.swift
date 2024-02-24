//
//  GenericExtension.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 24.02.2024.
//

import UIKit

extension UITableView {
    func isValid(indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0
            && indexPath.section < self.numberOfSections
            && indexPath.row >= 0
            && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}

extension UICollectionView {
    func isValid(indexPath: IndexPath) -> Bool {
        guard indexPath.section < numberOfSections,
              indexPath.row < numberOfItems(inSection: indexPath.section)
            else { return false }
        return true
    }
}
