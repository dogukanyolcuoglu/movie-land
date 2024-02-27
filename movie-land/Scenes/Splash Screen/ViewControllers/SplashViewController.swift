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
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: SplashViewModel!
    var coordinator: SplashCoordinator!
    var goDashBoard = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeMethod()
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
        self.viewModel.firebaseConfig { (title) in
            self.companyNameLabel.text = title
            self.companyNameLabel.textAlignment = .center
            self.descriptionLabel.text = "Devam etmek için buraya tıkla"
            self.goDashBoard = true
        }
    }
    
    func subscribeMethod() {
        self.noInternetSucject.subscribe(with: self) { [weak self] (success) in
            guard let self else { return }
            if success {
                configure()
            }
        }
    }
    
    @IBAction func continueButtonClicked(_ sender: Any) {
        if goDashBoard {
            self.coordinator.goToDashBoardPage()
        }
    }
}
