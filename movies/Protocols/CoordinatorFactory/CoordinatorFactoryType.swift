//
//  CoordinatorFactoryType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 16.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol CoordinatorFactoryType {
    func makeEntryCoordinator(factory: EntryModuleFactoryType, navigator: NavigatorType) -> CoordinatorType
    func makeAuthCoordinator(factory: AuthModuleFactoryType, navigator: NavigatorType) -> CoordinatorType
    func makeMovieCoordinator(factory: MovieModuleFactoryType, navigator: NavigatorType) -> CoordinatorType
}
