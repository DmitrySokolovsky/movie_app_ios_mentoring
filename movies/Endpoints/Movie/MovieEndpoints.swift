//
//  MovieEndpoints.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

enum MoviePaths: String {
    case allMovies = "/3/movie/popular"
}

enum MovieEndpoints {
    case getAllMovies(page: Int)
    
    var endpoint: Endpoint {
        switch self {
        case .getAllMovies(let page):
            let params = [URLQueryItem(name: "page", value: String(describing: page))]
            return Endpoint(path: MoviePaths.allMovies.rawValue, parameters: self.getParameters(params), method: "GET")
        }
    }
        
    func getParameters(_ parameters: [URLQueryItem]) -> [URLQueryItem] {
        return defaultParams + parameters
    }
}
