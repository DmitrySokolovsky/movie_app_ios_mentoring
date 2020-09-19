//
//  MovieTableViewModelType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol MovieTableViewModelType {
    var movieService: MovieServiceType { get }
    var errorMessage: String? { get }
    var movies: [Movie]? { get }
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MovieCellViewModel?
    func fetchMovies(page: Int, complition: @escaping () -> ()) -> ()
}
