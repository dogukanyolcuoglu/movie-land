//
//  UIWindow+ChangeRootView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 21.02.2024.
//

import Foundation
import UIKit

extension UIWindow {
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            self.rootViewController = rootViewController
        }
    }
}
