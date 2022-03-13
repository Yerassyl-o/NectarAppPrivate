//
//  OnbordingPresenter.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol OnbordingPresenter: AnyObject {
    var view: OnbordingView! { get set }
    var coordinator: RegisterCoordinator! { get set }
    
    func onButtonDidTap()
}

final class OnbordingPresenterImpl {
    
    // MARK: - Public Properties
    
    weak var view: OnbordingView!
    weak var coordinator: RegisterCoordinator!
    
    init() {}
}

// MARK: - OnbordingPresenter

extension OnbordingPresenterImpl: OnbordingPresenter {
    
    func onButtonDidTap() {
        coordinator.showSignIn()
    }
}
