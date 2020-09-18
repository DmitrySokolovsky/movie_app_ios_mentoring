//
//  MovieService.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class MovieService: MovieServiceType {
    var networkManager: NetworkManagerType
    var imageManager: ImageManagerType
    
    init() {
        networkManager = NetworkManager()
        imageManager = ImageManager()
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
    
    func loadMovieImage(imageName: String, complition: @escaping (Result<UIImage, Error>) -> ()) {
        let imageUrl = ImagePath().getImageUrl(for: imageName)
        
        imageManager.loadImage(from: imageUrl) { result in
            switch result {
            case .success(let image): // ???
                DispatchQueue.main.async {
                    complition(.success(image))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    complition(.failure(error))
                }
            }
        }
    }
}
