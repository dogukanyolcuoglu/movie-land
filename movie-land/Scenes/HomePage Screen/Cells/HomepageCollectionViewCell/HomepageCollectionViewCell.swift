//
//  HomepageCollectionViewCell.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit

class HomepageCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ item: ListItem) {
//        imageView.image
        titleLabel.text = item.title
        releaseDateLabel.text = item.releaseDate
    }

}
