//
//  HomepageTableViewCell.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit

class HomepageTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var collectionView: UICollectionView!

    var isHorizontal = false
    var sectionItems: [HomePageSectionModelItem]! {
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
    }
    
    func setup() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = isHorizontal ? .horizontal : .vertical
        collectionView.collectionViewLayout = collectionViewLayout
        self.scrollTop()
        self.collectionView.reloadData()
    }
    
    func scrollTop() {
        let indexPath = IndexPath(row: 0, section: 0)
        if self.collectionView.isValid(indexPath: indexPath) {
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}
