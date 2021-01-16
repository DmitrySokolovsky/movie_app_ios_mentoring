//
//  MovieCoordinator.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 16.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieCoordinator: BaseCoordinator {
    var factory: MovieModuleFactoryType
    var navigator: NavigatorType
    private var movieDetailsVM: MovieDetailsViewModelType?

    init(factory: MovieModuleFactoryType, navigator: NavigatorType) {
        self.factory = factory
        self.navigator = navigator
    }
    
    override func start() {
        showMovieTable()
    }
    
    func showMovieTable() {
        let movieTableVC = factory.makeMovieTableView()
        movieTableVC.viewModel = MovieTableViewModel()
        movieTableVC.onMoviePress = { [weak self] viewModel in
            self?.showMovieDetails(viewModel: viewModel)
        }
        navigator.navigate(module: movieTableVC)
    }
    
    func showMovieDetails(viewModel: MovieDetailsViewModelType) {
        let movieDetailsVC = factory.makeMovieDetailsView()
        movieDetailsVC.viewModel = viewModel
        navigator.navigate(module: movieDetailsVC)
    }
}
