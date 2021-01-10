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
    private let authViewControllerFactory = MovieViewControllerFactory()

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
    }
}
