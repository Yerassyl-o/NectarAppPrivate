//
//  ApplicationCoordinator.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol AppCoordinator: Coordinator {
    func start()
}

final class AppCoordinatorImpl {
    
    // MARK: - Public Properties
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Private Properties
    
    private let rootViewControllerPresenter: RootViewControllerPresenter
    private let coordinatorsFactory: AppCoordinatorFactory

    
    // MARK: - Init
    
    init(rootViewControllerPresenter: RootViewControllerPresenter,
         coordinatorsFactory: AppCoordinatorFactory) {
        self.rootViewControllerPresenter = rootViewControllerPresenter
        self.coordinatorsFactory = coordinatorsFactory
    }
    
    convenience init(window: UIWindow?) {
        let rootViewControllerPresenter = RootViewControllerPresenterImpl(window: window)
        self.init(rootViewControllerPresenter: rootViewControllerPresenter,
                  coordinatorsFactory: AppCoordinatorFactoryImpl())
    }
    
}

// MARK: - AppCoordinator

extension AppCoordinatorImpl: AppCoordinator {
    
    func start() {
        let coordinator = coordinatorsFactory.createRegisterCoordinator()
        coordinator.start()
        addChildCoordinator(coordinator)
        rootViewControllerPresenter.presentViewController(coordinator.rootViewController, withAnimations: true)
    }
}
