//
//  SignInModuleFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

typealias SignInModuleFactory = AnyModuleFactory<RegisterCoordinator, SignInresenter>

struct SignInModuleFactoryImpl: ModuleFactory {
    
    func createModule(withCoordinator coordinator: RegisterCoordinator) -> Module<SignInresenter> {
        let viewController = SingInViewController.instantiate()
        viewController.presenter = SignInresenterImpl()
        viewController.presenter.coodinator = coordinator
        viewController.presenter.view = viewController
        
        return Module(view: viewController, presenter: viewController.presenter)
    }
}
