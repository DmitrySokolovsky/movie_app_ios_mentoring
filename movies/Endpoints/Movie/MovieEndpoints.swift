//
//  MovieEndpoints.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

enum MovieEndpoints {
    case all
    
    func getUrl(page: Int) -> String {
        switch self {
        case .all:
            return "https://api.themoviedb.org/3/movie/popular?api_key=02f23dd0ea131e1da0741220bb29d198&language=en-US&page=\(page)"
        }
            
    }
}

