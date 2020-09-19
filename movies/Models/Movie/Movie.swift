//
//  Movie.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

struct Movie: Decodable, MovieType {
    var id: Int
    var title: String
    var overview: String?
    var poster_path: String?
}

struct MovieList: Decodable, MovieListType {
    var results: [Movie]
    var page: Int
    var total_pages: Int
}
