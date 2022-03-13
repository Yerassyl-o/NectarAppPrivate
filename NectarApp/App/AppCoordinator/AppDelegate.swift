//
//  AppDelegate.swift
//  NectarApp
//
//  Created by Yerassyl Orazbekov on 16.11.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator?

    // MARK: - Private Properties
    
    private lazy var appCoordinator: AppCoordinator = {
        window = UIWindow()
        let coordinator = AppCoordinatorImpl(window: window)
        return coordinator
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabbarAppearance = UITabBarItem.appearance()
        tabbarAppearance.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)], for: .normal)
        appCoordinator.start()
        return true
    }
}

