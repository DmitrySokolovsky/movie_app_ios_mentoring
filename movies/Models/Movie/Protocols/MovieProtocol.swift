//
//  MovieProtocol.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/19/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol MovieType {
    var id: Int { get set }
    var title: String { get set }
    var overview: String? { get set }
    var poster_path: String? { get set }
}

protocol MovieListType {
    var page: Int { get set }
    var total_pages: Int { get set }
    var results: [Movie] { get set }
}

protocol MovieDetailsType {
    var id: Int { get set }
    var title: String { get set }
    var overview: String? { get set }
    var poster_path: String? { get set }
    var homepage: String? { get set }
    var popularity: Double { get set }
    var release_date: String { get set }
    var vote_average: Double { get set }
}
