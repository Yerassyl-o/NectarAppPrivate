//
//  TabBarPresenter.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol TabBarPresenter: AnyObject {
    var view: TabBarView! { get set }
    var coordinator: TabBarCoordinator! { get set }
    
    func getTabBarFrame() -> CGRect
    func shouldSelect(viewController: UIViewController) -> Bool
}

final class TabBarPresenterImpl {
    
    // MARK: - Public Properties
    
    weak var view: TabBarView!
    weak var coordinator: TabBarCoordinator!
    
}

// MARK: - TabBarPresenter

extension TabBarPresenterImpl: TabBarPresenter {
        
    func getTabBarFrame() -> CGRect {
        let frame = view.getTabBarFrame()
        return CGRect(x: frame.origin.x, y: frame.origin.y - 15, width: frame.width, height: frame.height)
    }
    
    func shouldSelect(viewController: UIViewController) -> Bool {
        return coordinator.shouldChangeModule(for: viewController)
    }
}
