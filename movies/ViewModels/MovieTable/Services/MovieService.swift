//
//  MovieService.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class MovieService: MovieServiceType {
    var networkManager: NetworkManagerType
    
    init() {
        networkManager = NetworkManager()
    }
    
    func getMovies(complition: @escaping (Result<MovieList, Error>) -> ()) {
        networkManager.makeRequest(endpoint: MovieEndpoints.getAllMovies(page: 1).getEndpoint()) {(result: Result<MovieList, Error>) in
            switch result {
            case .success(let movieList):
                DispatchQueue.main.async {
                    complition(.success(movieList))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    complition(.failure(error))
                }
            }
        }
    }
}
