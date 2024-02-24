//
//  SplashViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import Foundation
import UIKit
import Lottie
import FirebaseRemoteConfig
import Signals

class SplashViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: SplashViewModel!
    var coordinator: SplashCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.play()
        animationView.loopMode = .loop
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        noInternetSucject.cancelSubscription(for: self)
    }
    
    deinit {
        noInternetSucject.cancelSubscription(for: self)
    }
    
    func configure() {
        self.noInternetSucject.subscribe(with: self) { [weak self] (data) in
            if data {
                self?.viewModel.firebaseConfig { (title) in
                    self?.companyNameLabel.text = title
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self?.coordinator.goToDashBoardPage()
                    }
                }
            }
        }
    }
}
