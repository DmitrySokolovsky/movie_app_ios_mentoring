//
//  MovieServiceType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol MovieServiceType {
    var networkManager: NetworkManagerType { get }
    func getMovies(complition: @escaping (Result<MovieList, Error>) -> ())
}
