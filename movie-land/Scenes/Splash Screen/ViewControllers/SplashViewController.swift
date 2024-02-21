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
        viewModel.firebaseConfig { (title) in
            self.companyNameLabel.text = title
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.coordinator.goToDashBoardPage()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
