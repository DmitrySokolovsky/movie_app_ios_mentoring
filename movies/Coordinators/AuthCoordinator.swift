//
//  AuthCoordinator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 15.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class AuthCoordinator: BaseCoordinator, CoordinatorOutputType {
    var finishFlow: (() -> Void)?
    
    private let factory: AuthModuleFactoryType
    private let navigator: NavigatorType
     
    init(factory: AuthModuleFactoryType, navigator: NavigatorType) {
        self.factory = factory
        self.navigator = navigator
    }
    
    override func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginVC = factory.makeSignInViewController()
        loginVC.onCompleteLogin = { [weak self] in
            self?.finishFlow?()
        }
        
        loginVC.onSignUpButtonPress = { [weak self] in
            self?.showSignUp()
        }
        
        navigator.setRootModule(module: loginVC, hideNavBar: true)
    }
    
    func showSignUp() {
        let signUpVC = factory.makeSignUpViewController()
        signUpVC.onCompleteSignUp = { [weak self] in
            self?.finishFlow?()
        }
        
        signUpVC.onLeaveScreen = { [weak self] in
            self?.navigator.setNavBarHidden(navBarHidden: true)
        }
        
        navigator.navigate(module: signUpVC, isNavBarHidden: false)
    }
}
