//
//  HomepageHeaderView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import UIKit

class HomepageHeaderView: UIView, NibInitializable {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var nibName: String = "HomepageHeaderView"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize(withNibName: self.nibName, postInitialize)
    }
    
    private func postInitialize(_ view: UIView) {
        
    }

}
