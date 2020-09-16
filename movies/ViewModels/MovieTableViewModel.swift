//
//  MovieTableViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieTableViewModel: TableViewModelType {
    private var movies: [Movie]?

    func numberOfRows() -> Int {
        return movies?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MovieCellViewModel? {
        guard let movie = movies?[indexPath.row] else { return nil }
        return MovieCellViewModel(movie: movie)
    }
    
    func fetchMovies(complition: @escaping () -> ()) {
    }
    
}
