//
//  SingInViewPresenter.swift
//  NectarApp
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol SignInresenter: AnyObject {
    var view: SingInView! { get set }
    var coodinator: RegisterCoordinator! { get set }
    
    func onGoogleButtonDidTap()
    func onFacebookButtonDiDTap()
}

final class SignInresenterImpl {
    
    // MARK: - Public Properties
    
    weak var view: SingInView!
    weak var coodinator: RegisterCoordinator!
    
    init() {}
}

// MARK: - SingInViewPresenter

extension SignInresenterImpl: SignInresenter {
    
    func onGoogleButtonDidTap() {
        coodinator.runTabbarFlow()
    }
    
    func onFacebookButtonDiDTap() {
        coodinator.runTabbarFlow()
    }
}
