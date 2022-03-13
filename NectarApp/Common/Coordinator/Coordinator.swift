//
//  Coordinator.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    var parentCoordinator: Coordinator? {
        get {
            return nil
        }
        set {}
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    func removeAllCoordinators() {
        childCoordinators.removeAll()
    }
    
    func owner(of coordinator: Coordinator) -> Coordinator? {
        
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return self
        } else {
            for childCoordinator in childCoordinators {
                if let owner = childCoordinator.owner(of: coordinator) {
                    return owner
                }
            }
        }
        return nil
    }
}
