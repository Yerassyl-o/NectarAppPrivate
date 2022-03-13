//
//  ModuleFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

struct Module<T> {
    var view: UIViewController
    var presenter: T
}

protocol ModuleFactory {
    associatedtype CoordinatorFlow
    associatedtype ModuleType
    
    func createModule(withCoordinator coordinator: CoordinatorFlow) -> Module<ModuleType>
}
