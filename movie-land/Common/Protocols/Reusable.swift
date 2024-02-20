//
//  Reusable.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: String(describing: self), bundle: nil) }
}

// MARK: - CollectionView Reusable Cell Configure

extension UICollectionView {
    
    final func register<T: UICollectionViewCell>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func registerSupplementaryView<T: UICollectionViewCell>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func registerSupplementaryView<T: UICollectionReusableView>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: Reusable {
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand")
            }
        return cell
    }
    
}

// MARK: - TableView Reusable Cell Configure

extension UITableView {
    
    final func register<T: UITableViewCell>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func registerHeaderFooterView<T: UITableViewHeaderFooterView>(cellType: T.Type)
        where T: Reusable {
            self.register(cellType.nib, forHeaderFooterViewReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T
        where T: Reusable {
            guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand")
            }
        return cell
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(cellType: T.Type = T.self) -> T
        where T: Reusable {
            guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: cellType.reuseIdentifier) as? T else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                        + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                        + "and that you registered the cell beforehand")
            }
        return cell
    }
}
