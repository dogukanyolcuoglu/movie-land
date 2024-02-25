//
//  BaseViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit
import SnapKit
import Signals

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    
    override var tabBarController: UITabBarController? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        guard let tabBarController = appDelegate.window?.rootViewController as? TabBarController else { return nil }
        return tabBarController
    }
    
    let reachability = try! Reachability()
    var noInternetView: EmptyComponentView? = nil
    var noInternetSucject = Signal<Bool>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func removeNavigationBarShadow(){
        self.navigationController?.navigationBar.isTranslucent = false
        let image = UIImage()
        self.navigationController?.navigationBar.shadowImage = image
        self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeReachability(false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func subscribeReachability(_ isSplashPage : Bool){
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                self.noInternetSucject.fire(true)
                self.removeInternetView()
            }
            self.reachability.whenUnreachable = { _ in
                print("Not reachable")
                self.showNoInternetView(false)
                self.noInternetSucject.fire(false)
            }

            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
    
    deinit {
        reachability.stopNotifier()
    }
    
    func showNoInternetView(_ isSplashPage : Bool){
        noInternetView = EmptyComponentView.loadFromNib()
        noInternetView?.tag = 1009
        if let window = AppDesign.window {
            window.subviews.forEach({ if $0.tag == 1009 {$0.removeFromSuperview()} })
            window.addSubview(noInternetView!)
            noInternetView!.snp.makeConstraints({ make in
                make.leading.trailing.top.bottom.equalToSuperview()
            })
            noInternetView?.descriptionLabel.text = Texts.InternetConnection.message
            noInternetView?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            noInternetView?.imageView.image = Images.CommonImages.noInternet
            noInternetView?.setup()
        }
    }
    
    func removeInternetView(){
        if AppDesign.window?.viewWithTag(1009) != nil {
            let view = AppDesign.window?.viewWithTag(1009) as! EmptyComponentView
            view.removeFromSuperview()
            noInternetView = nil
        }
    }
}
