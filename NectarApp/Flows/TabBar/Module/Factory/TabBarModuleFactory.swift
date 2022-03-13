//
//  TabBarModuleFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

typealias TabBarModuleFactory = AnyModuleFactory<TabBarCoordinator, TabBarPresenter>

struct TabBarModuleFactoryImpl: ModuleFactory {
    
    func createModule(withCoordinator coordinator: TabBarCoordinator) -> Module<TabBarPresenter> {
        let viewController = TabBarController()
        viewController.presenter = TabBarPresenterImpl()
        viewController.presenter.coordinator = coordinator
        viewController.presenter.view = viewController
        
        return Module(view: viewController, presenter: viewController.presenter)
    }
}
