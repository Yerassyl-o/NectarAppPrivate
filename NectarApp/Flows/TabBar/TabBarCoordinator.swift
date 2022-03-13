//
//  TabBarCoordinator.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation
import UIKit

protocol TabBarCoordinatorDelegate: AnyObject {
    func tabBarCoordinatorDidFinish(with coordinator: TabBarCoordinator)
}

protocol TabBarCoordinator: Coordinator {
    var delegate: TabBarCoordinatorDelegate? { get set }
    var rootViewController: UITabBarController { get }
    
    func start()
    func shouldChangeModule(for viewController: UIViewController) -> Bool
}

final class TabBarCoordinatorImpl {
    
    // MARK: - Public Properties
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UITabBarController {
        return tabBarController
    }
    
    weak var delegate: TabBarCoordinatorDelegate?
    
    // MARK: - Private Properties
    
    private var tabBarController: UITabBarController!
    
    // MARK: - Dependency
    
    private let modulesFactory: TabBarModulesFactory
    private let coordinatorsFactory: TabBarCoordinatorsFactory
    private weak var tabBarPresenter: TabBarPresenter?
    private weak var additionalViewController: UIViewController?
    
    // MARK: - Init
    
    init(modulesFactory: TabBarModulesFactory, coordinatorsFactory: TabBarCoordinatorsFactory) {
        self.modulesFactory = modulesFactory
        self.coordinatorsFactory = coordinatorsFactory
    }
    
    convenience init() {
        self.init(modulesFactory: TabBarModulesFactoryImpl(), coordinatorsFactory: TabBarCoordinatorsFactoryImpl())
    }
}

// MARK: - TabBarCoordinator

extension TabBarCoordinatorImpl: TabBarCoordinator {
    
    func start() {
        let module = modulesFactory.createTabBarModule(with: self)
        tabBarController = module.view as? UITabBarController
        tabBarPresenter = module.presenter
        setupRootModule()
    }
    
    func shouldChangeModule(for viewController: UIViewController) -> Bool {
        return true
    }
}

// MARK: - Private

private extension TabBarCoordinatorImpl {
    
    func setupRootModule() {
        let registerController = createRegisterModule()
        let registerController2 = createRegisterModule()
        let registerController3 = createRegisterModule()
        let registerController4 = createRegisterModule()
        let registerController5 = createRegisterModule()
        tabBarController.setViewControllers([registerController2,
                                             registerController3,
                                             registerController4,
                                             registerController5,
                                             registerController],
                                            animated: true)
    }
    
    func createRegisterModule() -> UIViewController {
        let coordinator = coordinatorsFactory.createRegisterFlow()
        coordinator.parentCoordinator = self
        coordinator.start()
        addChildCoordinator(coordinator)
        coordinator.rootViewController.tabBarItem = UITabBarItem(title: "Register",
                                                                 image: UIImage(systemName: "person"),
                                                                 selectedImage: UIImage(systemName: "close"))
        return coordinator.rootViewController
    }
}
