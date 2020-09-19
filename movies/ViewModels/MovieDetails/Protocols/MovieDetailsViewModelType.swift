//
//  MovieDetailsType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol MovieDetailsViewModelType {
    var movieDetails: MovieDetailsType? { get }
    var movieService: MovieServiceType { get }
    var movieId: Int { get set }
    func getMovieDetails(complition: @escaping () -> ()) -> ()
//    func getSimilarMovies(movieId: Int, complition: @escaping () -> ()) -> ()
}
