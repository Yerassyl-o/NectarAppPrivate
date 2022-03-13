//
//  RegisterCoordinatorFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol RegisterCoordinatorFactory {
    func createTabbar() -> TabBarCoordinatorImpl
}

struct RegisterCoordinatorFactoryImpl {}

extension RegisterCoordinatorFactoryImpl: RegisterCoordinatorFactory {
    func createTabbar() -> TabBarCoordinatorImpl {
        TabBarCoordinatorImpl()
    }
}
