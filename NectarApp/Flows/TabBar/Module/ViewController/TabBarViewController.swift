//
//  TabBarViewController.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit


protocol TabBarView: AnyObject {
    func selectViewController(at index: Int)
    func getTabBarFrame() -> CGRect
}


final class TabBarController: UITabBarController {
    
    // MARK: - Public Properties
    
    var presenter: TabBarPresenter!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - TabBarView

extension TabBarController: TabBarView {
    
    func getTabBarFrame() -> CGRect {
        return tabBar.frame
    }
    
    func selectViewController(at index: Int) {
        selectedIndex = index
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return presenter.shouldSelect(viewController: viewController)
    }
}

// MARK: - Private

private extension TabBarController {
    
    func setupUI() {
        delegate = self
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
}
