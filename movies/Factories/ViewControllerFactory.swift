//
//  ViewControllerFactory.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 14.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class ViewControllerFactory: AuthModuleFactoryType, EntryModuleFactoryType, MovieModuleFactoryType {
    
    func makeMovieTableController() -> MoviesTableViewController {
        let movieTableVC = MoviesTableViewController()
        return movieTableVC
    }
    
    func makeMovieDetailsViewController() -> DetailsViewController {
        let detailsVC = DetailsViewController()
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
