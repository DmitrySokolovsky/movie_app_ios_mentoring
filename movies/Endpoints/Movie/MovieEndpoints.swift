//
//  MovieEndpoints.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

enum MovieEndpoints {
    case getAllMovies(page: Int)
    case getDetails(movieId: Int)
    
    var endpoint: Endpoint {
        switch self {
        case .getAllMovies(let page):
            let params = [URLQueryItem(name: "page", value: String(describing: page))]
            return Endpoint(path: "/3/movie/popular", parameters: self.getParameters(params), method: .get)
        case .getDetails(let movieId):
            return Endpoint(path: "/3/movie/\(movieId)", parameters: defaultParams, method: .get)
        }
    }
        
    func getParameters(_ parameters: [URLQueryItem]) -> [URLQueryItem] {
        return defaultParams + parameters
    }
}
