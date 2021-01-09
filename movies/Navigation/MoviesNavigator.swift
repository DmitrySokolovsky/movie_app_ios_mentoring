//
//  MoviesNavigator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class MovieNavigator: Navigator {
    private weak var navigationController: UINavigationController?
    private let viewControllerFactory = MovieViewControllerFactory()
    
    enum Route {
        case movieTable
        case movieDetails
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to route: Route, viewModel: Any?) {
        
        guard let navController = navigationController else {
            return
        }
        
        let viewControllerToPresent = makeViewController(for: route, viewModel: viewModel)
        
        navController.pushViewController(viewControllerToPresent, animated: true)
    }
    
    func makeViewController(for route: Route, viewModel: Any?) -> UIViewController {
        
        switch route {
        case .movieDetails:
            return viewControllerFactory.makeViewController(controller: .movieDetailsController(viewModel: viewModel as? MovieDetailsViewModelType))
        case .movieTable:
            return viewControllerFactory.makeViewController(controller: .movieTableController)
        }
    }
}
