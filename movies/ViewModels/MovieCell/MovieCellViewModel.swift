//
//  MovieCellViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class MovieCellViewModel: MovieCellViewModelType {
    var imageManager: ImageManagerType?
    var image: UIImage?
    var imagePath: String?
    var title: String
    
    init(movie: Movie) {
        imageManager = ImageManager()
        self.imagePath = movie.poster_path
        self.title = movie.title
    }
    
    func getMovieImage(complition: @escaping () -> ()) {
        if let imagePath = self.imagePath {
            let imageUrl = ImagePath().getImageUrl(for: imagePath)
            imageManager?.loadImage(from: imageUrl) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async { [weak self] in
                        self?.image = image
                        complition()
                    }
                case .failure(let error):
                    print("Here should be added some kind of default image", error.localizedDescription)
                }
            }
        }
    }
}
