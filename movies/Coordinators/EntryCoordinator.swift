//
//  EntryCoordinator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 16.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class EntryCoordinator: BaseCoordinator, CoordinatorOutputType {
    var finishFlow: (() -> Void)?
    
    var navigator: NavigatorType
    var factory: EntryModuleFactoryType
    
    init(factory: EntryModuleFactoryType, navigator: NavigatorType) {
        self.factory = factory
        self.navigator = navigator
    }
    
    override func start() {
        showEntryScreen()
    }
    
    func showEntryScreen() {
        let entryVC = factory.makeEntryViewController()
        entryVC.onCompleteUserCheck = { [weak self] in
            self?.finishFlow?()
        }
        navigator.navigate(module: entryVC, isNavBarHidden: true)
    }
}
