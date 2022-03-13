//
//  RegisterCoordinator.swift.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol RegisterCoordinator: Coordinator {
    var rootViewController: UINavigationController { get }
    
    func start()
    
    func showSignIn()
    func runTabbarFlow()
}

final class RegisterCoordinatorImpl {
    
    // MARK: - Public Properties
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UINavigationController {
        return viewController
    }
    
    // MARK: - Private Properties
    
    private var viewController: UINavigationController!
    
    // MARK: - Dependency
    
    private let modulesFactory: RegisterModuleFactory
    private let coordinatorFactory: RegisterCoordinatorFactory
    
    // MARK: - Init
    
    init(modulesFactory: RegisterModuleFactory,
         coordinatorFactory: RegisterCoordinatorFactory) {
        self.modulesFactory = modulesFactory
        self.coordinatorFactory = coordinatorFactory
    }
    
    convenience init() {
        self.init(modulesFactory: RegisterModuleFactoryImpl(),
                  coordinatorFactory: RegisterCoordinatorFactoryImpl())
    }
}

extension RegisterCoordinatorImpl: RegisterCoordinator {
   
    func start() {
        let module = modulesFactory.createOnboardingModule(with: self)
        viewController = UINavigationController(rootViewController: module.view)
    }
    
    func showSignIn() {
        let module = modulesFactory.createSignInModule(with: self)
        rootViewController.show(module.view, sender: nil)
    }
    
    func runTabbarFlow() {
        let coordinator = coordinatorFactory.createTabbar()
        coordinator.start()
        addChildCoordinator(coordinator)
        coordinator.rootViewController.modalPresentationStyle = .fullScreen
        rootViewController.present(coordinator.rootViewController, animated: false)
    }
}
