//
//  MovieTableViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieTableViewModel: MovieTableViewModelType {
    internal var movieService: MovieServiceType = MovieService()
    
    internal var movies: [Movie]?
    
    var errorMessage: String? // Currently just class field

    func numberOfRows() -> Int {
        return movies?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MovieCellViewModel? {
        guard let movie = movies?[indexPath.row] else { return nil }
        return MovieCellViewModel(movie: movie)
    }
    
    func fetchMovies(page: Int, complition: @escaping () -> ()) {
        movieService.getMovies(page: page) { [weak self] result in
            switch result {
            case .success(let movies):
                print(movies.results.count)
                self?.movies = movies.results
                complition()
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                complition()
            }
        }
    }
    
}
