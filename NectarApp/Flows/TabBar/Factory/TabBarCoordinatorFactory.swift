//
//  TabBarCoordinatorFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

import Foundation

protocol TabBarCoordinatorsFactory {
    func createRegisterFlow() -> RegisterCoordinator
}

struct TabBarCoordinatorsFactoryImpl {}

// MARK: - TabBarCoordinatorsFactory

extension TabBarCoordinatorsFactoryImpl: TabBarCoordinatorsFactory {
    
    func createRegisterFlow() -> RegisterCoordinator {
        RegisterCoordinatorImpl()
    }
}
