//
//  OnbordingModuleFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

typealias OnbordingModuleFactory = AnyModuleFactory<RegisterCoordinator, OnbordingPresenter>

struct OnbordingModuleFactoryImpl: ModuleFactory {
    
    func createModule(withCoordinator coordinator: RegisterCoordinator) -> Module<OnbordingPresenter> {
        let viewController = OnbordingViewController.instantiate()
        viewController.presenter = OnbordingPresenterImpl()
        viewController.presenter.coordinator = coordinator
        viewController.presenter.view = viewController
        return Module(view: viewController, presenter: viewController.presenter)
    }
}
