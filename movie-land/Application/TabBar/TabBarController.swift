//
//  TabBarController.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    var coordinator: TabbarCoordinator?
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let destinationIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return false }
        guard let selectedTab = Tab(rawValue: selectedIndex) else { return false }
        guard let destinationTab = Tab(rawValue: destinationIndex) else { return false }
        currentViewController = viewController

        return true
    }
    
    private func setupAppearance() {
        self.delegate = self
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor =  .black
        tabBar.tintColor = Colors.TabBarColors.heavyRedColor
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        
        self.configureTabBarItem()
    }
    
    private func configureTabBarItem() {
        let tabBarItemAppearance = UITabBarItem.appearance()
        tabBarItemAppearance.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11),
        ]
        
        tabBarItemAppearance.badgeColor = Colors.TabBarColors.heavyRedColor
        tabBarItemAppearance.setBadgeTextAttributes(titleAttributes, for: .normal)
        tabBarItemAppearance.setBadgeTextAttributes(titleAttributes, for: .selected)
        tabBarItemAppearance.setTitleTextAttributes(titleAttributes, for: .normal)
    }

}
