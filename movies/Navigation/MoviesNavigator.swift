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
        case movieDetails(viewModel: MovieDetailsViewModelType?)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to route: Route) {
        
        guard let navController = navigationController else {
            return
        }
        
        let viewControllerToPresent = makeViewController(for: route)
        
        navController.pushViewController(viewControllerToPresent, animated: true)
    }
    
    func makeViewController(for route: Route) -> UIViewController {
        
        switch route {
        case .movieDetails(let viewModel):
            return viewControllerFactory.makeViewController(controller: .movieDetailsController(viewModel: viewModel))
        case .movieTable:
            return viewControllerFactory.makeViewController(controller: .movieTableController)
        }
    }
}
