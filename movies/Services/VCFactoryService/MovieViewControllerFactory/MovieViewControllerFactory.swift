//
//  MovieViewControllerFactory.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 8.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class MovieViewControllerFactory: ViewControllerFactoryType {
    enum ViewControllerInstance {
        case movieTableController
        case movieDetailsController(viewModel: MovieDetailsViewModelType?)
    }
    
    func makeViewController(controller: ViewControllerInstance) -> UIViewController {
        switch controller {
        case .movieTableController:
            return MoviesTableViewController()
        case .movieDetailsController(let viewModel):
            let detailsVC = DetailsViewController()
            detailsVC.viewModel = viewModel
            return detailsVC
        }
    }
}
