//
//  ViewControllerFactory.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 14.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFactory: AuthViewControllerFactoryType {
    func makeMovieTableController(movieTableViewModel: MovieTableViewModelType) -> MoviesTableViewController {
        let movieTableVC = MoviesTableViewController()
        movieTableVC.viewModel = movieTableViewModel
        return movieTableVC
    }
    
    func makeMovieDetailsViewController(movieDetailsViewModel: MovieDetailsViewModelType) -> DetailsViewController {
        let detailsVC = DetailsViewController()
        detailsVC.viewModel = movieDetailsViewModel
        return detailsVC
    }
    
    func makeSignInViewController() -> LoginViewController {
        return LoginViewController()
    }
    
    func makeEntryViewController() -> EntryViewController {
        return EntryViewController()
    }
    
    func makeSignUpViewController() -> SignUpViewController {
        return SignUpViewController()
    }
}
