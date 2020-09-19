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
    
    func getMovies(page: Int, complition: @escaping (Result<MovieListType, Error>) -> ()) {
        networkManager.makeRequest(endpoint: MovieEndpoints.getAllMovies(page: page).endpoint) {(result: Result<MovieList, Error>) in
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
    
    func getMovieDetails(movieId: Int, complition: @escaping (Result<MovieDetailsType, Error>) -> ()) {
        networkManager.makeRequest(endpoint: MovieEndpoints.getDetails(movieId: movieId).endpoint) {(result: Result<MovieDetails, Error>) in
            switch result {
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    complition(.success(movieDetails))
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
            case .success(let image):
                DispatchQueue.main.async {
                    guard let image = image else {
                        complition(.success(UIImage(imageLiteralResourceName: "placeholder_meadia")))
                        return
                    }
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
