//
//  UIView+LoadFromNib.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation
import UIKit

protocol NibInitializable {
    var nibName: String { get set }
}

extension NibInitializable where Self: UIView {
    internal func initialize(withNibName nibName: String, _ initializeCallback: ((UIView) -> Void)? = nil) {
        unowned let weakSelf = self
        guard let view = weakSelf.loadView(fromNibName: nibName) else {
            print("failed to initialize nib, nibName: \(nibName)")
            return
        }
        
        view.frame = weakSelf.bounds
        weakSelf.addSubview(view)
        initializeCallback?(view)
    }
    
    private func loadView(fromNibName nibName: String) -> UIView? {
        unowned let weakSelf = self
        
        let bundle = Bundle(for: type(of: weakSelf))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: weakSelf, options: nil).first as? UIView
    }
}
