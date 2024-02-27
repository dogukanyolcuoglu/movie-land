//
//  AppDelegate.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 20.02.2024.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import IQKeyboardManager
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().toolbarDoneBarButtonItemText = "Bitti"
        
        setupTabeView()
        startApp()
        setupNavigationBar()
        return true
    }
    
    private func startApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
    }

    private func setupTabeView() {
        if #available(iOS 15.0, *) {
           UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
    
    func setupNavigationBar() {
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
             navigationBarAppearance.configureWithOpaqueBackground()
             navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : Colors.TabBarColors.movieLandColor,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 21, weight: .bold)
             ]
             UINavigationBar.appearance().standardAppearance = navigationBarAppearance
             UINavigationBar.appearance().compactAppearance = navigationBarAppearance
             UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MovieLandCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveConfext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError ("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

