//
//  HomepageCollectionViewCell.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit
import Kingfisher

class HomepageCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ item: HomeMovieItem) {
        if let path = item.image, let url = URL(string: path) {
            let size = self.imageView.frame.size
            self.imageView.kf.indicatorType = .activity
            let resizeProcessor = ResizingImageProcessor(referenceSize: size, mode: .aspectFit)
            self.imageView.kf.setImage(with: url, options: [.backgroundDecode,.processor(resizeProcessor), .scaleFactor(UIScreen.main.scale),.cacheOriginalImage]) { [weak self] (result) in
                switch result {
                case .success(_): break
                case .failure(_):
                    let placeHolder = UIImage(systemName: "questionmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                    self?.imageView.image = placeHolder
                }
            }
        } else {
            let placeHolder = UIImage(systemName: "questionmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            self.imageView.image = placeHolder
        }
    }
}
