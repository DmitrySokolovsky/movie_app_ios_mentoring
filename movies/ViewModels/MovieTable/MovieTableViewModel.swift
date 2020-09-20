//
//  MovieTableViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieTableViewModel: MovieTableViewModelType {
    internal var movieService: MovieServiceType
    internal var movies: [Movie]?
    var errorMessage: String? // Currently just class field
    var selectedIndexPath: IndexPath?
    var page: Box<Int> = Box(1)
    
    init() {
        movieService = MovieService()
    }

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
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> MovieDetailsViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        guard let selectedMovieId = movies?[selectedIndexPath.row] else { return nil }
        
        return MovieDetailsViewModel(movieId: selectedMovieId.id)
    }
    
}
