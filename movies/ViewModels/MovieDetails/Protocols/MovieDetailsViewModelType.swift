//
//  MovieDetailsType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailsViewModelType {
    var movieDetails: MovieDetailsType? { get }
    var movieService: MovieServiceType { get }
    var errorMessage: String? { get }
    var movieId: Int { get set }
    func getMovieDetails(complition: @escaping () -> ()) -> ()
    func getMovieImage(complition: @escaping(_: UIImage?) -> ())
}
