//
//  AuthNavigator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class AuthNavigator: Navigator {
    private weak var navigationController: UINavigationController?
    private let movieViewControllerFactory = MovieViewControllerFactory()
    private let authViewControllerFactory = AuthViewControllerFactory()

    enum Route {
        case login
        case signUp
        case movieTable
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to route: Route) {
        guard let navController = navigationController else {
            return
        }
        
        let viewController = makeViewController(for: route)
        
        navController.pushViewController(viewController, animated: true)
    }
    
    func makeViewController(for route: Route) -> UIViewController {
        switch route {
        case .login:
            return authViewControllerFactory.makeViewController(controller: .login)
        case .signUp:
            return authViewControllerFactory.makeViewController(controller: .signUp)
        case .movieTable:
            return movieViewControllerFactory.makeViewController(controller: .movieTableController)
        }
    }
}
