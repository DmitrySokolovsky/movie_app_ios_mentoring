//
//  MovieServiceType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol MovieServiceType {
    var networkManager: NetworkManagerType { get }
    var imageManager: ImageManagerType { get }
    func getMovies(page: Int, complition: @escaping (Result<MovieListType, Error>) -> ())
    func loadMovieImage(imageName: String, complition: @escaping (Result<UIImage, Error>) -> ()) -> ()
}
