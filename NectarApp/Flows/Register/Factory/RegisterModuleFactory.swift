//
//  RegisterModuleFactory.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol RegisterModuleFactory {
    func createOnboardingModule(with coordinator: RegisterCoordinator) -> Module<OnbordingPresenter>
    func createSignInModule(with coordinator: RegisterCoordinator) -> Module<SignInresenter>
}

final class RegisterModuleFactoryImpl {
    
    // MARK: - Dependency
    
    private let onbordingModuleFactory: OnbordingModuleFactory
    private let signInModuleFactory: SignInModuleFactory
    
    // MARK: - Init
    
    init(onbordingModuleFactory: OnbordingModuleFactory,
         signInModuleFactory: SignInModuleFactory) {
        self.onbordingModuleFactory = onbordingModuleFactory
        self.signInModuleFactory = signInModuleFactory
    }
    
    convenience init() {
        self.init(onbordingModuleFactory: AnyModuleFactory(OnbordingModuleFactoryImpl()),
                  signInModuleFactory: AnyModuleFactory(SignInModuleFactoryImpl()))
    }
}
// MARK: - RegisterModuleFactory

extension RegisterModuleFactoryImpl: RegisterModuleFactory {
    
    func createOnboardingModule(with coordinator: RegisterCoordinator) -> Module<OnbordingPresenter> {
        let module = onbordingModuleFactory.createModule(withCoordinator: coordinator)
        return module
    }
    
    func createSignInModule(with coordinator: RegisterCoordinator) -> Module<SignInresenter> {
        let module = signInModuleFactory.createModule(withCoordinator: coordinator)
        return module
    }
}
