//
//  RootViewControllerPresenter.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol RootViewControllerPresenter {
    func presentViewController(_ viewController: UIViewController, withAnimations: Bool)
}

final class RootViewControllerPresenterImpl: RootViewControllerPresenter {
    
    // MARK: - Private Properties
    
    private let window: UIWindow?

    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - RootViewControllerPresenter
    
    func presentViewController(_ viewController: UIViewController, withAnimations: Bool = true) {
        guard let window = window else { return }
        window.rootViewController = viewController
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        window.makeKeyAndVisible()
        if withAnimations {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil)
        }
    }
}
