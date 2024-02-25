//
//  EmptyComponentView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit

class EmptyComponentView: UIView, NibLoadable {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        stackView.layer.cornerRadius = 5
        stackView.layer.masksToBounds = true
    }

}
