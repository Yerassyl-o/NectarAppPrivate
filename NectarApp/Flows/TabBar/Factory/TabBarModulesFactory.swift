//
//  TabBarModulesFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol TabBarModulesFactory: AnyObject {
    func createTabBarModule(with coordinator: TabBarCoordinator) -> Module<TabBarPresenter>
}

final class TabBarModulesFactoryImpl {
    
    // MARK: - Dependency
    
    private let tabBarModuleFactory: TabBarModuleFactory
    
    // MARK: - Init
    
    init(tabBarModuleFactory: TabBarModuleFactory) {
        self.tabBarModuleFactory = tabBarModuleFactory
    }
    
    convenience init() {
        self.init(tabBarModuleFactory: AnyModuleFactory(TabBarModuleFactoryImpl()))
    }
}

// MARK: - TabBarModulesFactory

extension TabBarModulesFactoryImpl: TabBarModulesFactory {
    
    func createTabBarModule(with coordinator: TabBarCoordinator) -> Module<TabBarPresenter> {
        return tabBarModuleFactory.createModule(withCoordinator: coordinator)
    }
}
