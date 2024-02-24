//
//  LoadingView.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 21.02.2024.
//

import Foundation
import UIKit
import Lottie

class LoadingView {
    
    static let shared = LoadingView()
    
    private init() { }
    
    private lazy var transparentView: UIView = {
        let transparentView = UIView()
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return transparentView
    }()
    
    private lazy var animationView: LottieAnimationView = {
        var view: LottieAnimationView = LottieAnimationView(name: "animation")
        view.loopMode = .loop
        view.contentMode = .scaleAspectFit
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return view
    }()
    
    func showLoaderView() {
        DispatchQueue.main.async {
            if !self.animationView.isAnimationPlaying {
                guard let window = AppDesign.window else { return }
                let height = window.bounds.size.height
                let width = window.bounds.size.width
                self.transparentView.frame = CGRect(x: 0 ,y: 0, width: width, height: height)
                self.animationView.center = self.transparentView.center
                self.transparentView.addSubview(self.animationView)
                window.addSubview(self.transparentView)
                self.animationView.play()
            }
        }
    }
    
    func hideLoaderView() {
        DispatchQueue.main.async {
            if self.animationView.isAnimationPlaying {
                self.animationView.pause()
                self.animationView.removeFromSuperview()
                self.transparentView.removeFromSuperview()
            }
        }
    }
}
