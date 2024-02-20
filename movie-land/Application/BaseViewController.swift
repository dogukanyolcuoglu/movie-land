//
//  BaseViewController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    override var tabBarController: UITabBarController? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        guard let tabBarController = appDelegate.window?.rootViewController as? TabBarController else { return nil }
        return tabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
