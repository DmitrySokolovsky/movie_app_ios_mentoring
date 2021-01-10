//
//  AuthViewControllerFactory.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class AuthViewControllerFactory: ViewControllerFactoryType {
    enum ViewControllerInstance {
        case login
        case signUp
    }
    
    func makeViewController(controller: ViewControllerInstance) -> UIViewController {
        switch controller {
        case .login:
            return LoginViewController()
        case .signUp:
            return SignUpViewController()
        }
    }
}
