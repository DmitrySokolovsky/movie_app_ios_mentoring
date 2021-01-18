//
//  ApplicationCoordinator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 16.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFacrory: CoordinatorFactoryType
    private let navigator: NavigatorType
    
    private var launcher: Launcher {
        return Launcher.configure()
    }
    
    init(coordinatorFacrory: CoordinatorFactoryType, navigator: NavigatorType) {
        self.coordinatorFacrory = coordinatorFacrory
        self.navigator = navigator
    }
    
    override func start() {
        switch launcher {
        case .auth:
            runAuthFlow()
        case .entry:
            runEntryFlow()
        case .movie:
            runMovieFlow()
        }
    }
    
    func runAuthFlow() {
        let coordinator = coordinatorFacrory.makeAuthCoordinator(factory: ViewControllerFactory(), navigator: navigator)
        
        coordinator.finishFlow = { [weak self] in
            self?.removeDependency(coordinator: coordinator)
            self?.runAuthFlow()
        }
        
        addDependency(coordinator: coordinator)
        coordinator.start()
    }
    
    func runEntryFlow() {
        let coordinator = coordinatorFacrory.makeEntryCoordinator(factory: ViewControllerFactory(), navigator: navigator)
        
        coordinator.finishFlow = { [weak self] in
            self?.removeDependency(coordinator: coordinator)
            self?.runAuthFlow()
        }
        
        addDependency(coordinator: coordinator)
        coordinator.start()
    }
    
    func runMovieFlow() {
        let coordinator = coordinatorFacrory.makeMovieCoordinator(factory: ViewControllerFactory(), navigator: navigator)
        
        coordinator.start()
        
        // TODO add finish flow
    }
}
