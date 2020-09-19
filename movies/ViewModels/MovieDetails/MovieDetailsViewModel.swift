//
//  MovieDetailsViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieDetailsViewModel: MovieDetailsViewModelType {
    var movieId: Int
    var movieDetails: MovieDetailsType?
    var movieService: MovieServiceType
    var errorMessage: String!
    
    init(movieId: Int) {
        self.movieId = movieId
        movieService = MovieService()
    }
    
    func getMovieDetails(complition: @escaping () -> ()) {
        movieService.getMovieDetails(movieId: self.movieId) { [weak self] result in
            switch result {
            case .success(let movieDetails):
                self?.movieDetails = movieDetails
                complition()
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                complition()
            }
        }
    }
}
