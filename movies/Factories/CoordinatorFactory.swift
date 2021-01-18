//
//  CoordinatorFactory.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 14.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class CoordinatorFactory: CoordinatorFactoryType {    
    func makeAuthCoordinator(factory: AuthModuleFactoryType, navigator: NavigatorType) -> AuthCoordinator {
        let factory = ViewControllerFactory()
        let authCoordinator = AuthCoordinator(factory: factory, navigator: navigator)
        return authCoordinator
    }
    
    func makeEntryCoordinator(factory: EntryModuleFactoryType, navigator: NavigatorType) -> EntryCoordinator {
        let factory = ViewControllerFactory()
        let entryCoordinator = EntryCoordinator(factory: factory, navigator: navigator)
        return entryCoordinator
    }
    
    func makeMovieCoordinator(factory: MovieModuleFactoryType, navigator: NavigatorType) -> MovieCoordinator {
        let factory = ViewControllerFactory()
        let movieCoordinator = MovieCoordinator(factory: factory, navigator: navigator)
        return movieCoordinator
    }
}
