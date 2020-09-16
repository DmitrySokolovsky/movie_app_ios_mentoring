//
//  MovieCellViewModel.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class MovieCellViewModel: TableCellViewModelType {
    internal var dataForDisplay: Movie
    
    var image: UIImage?
    
    var title: String {
        return dataForDisplay.title
    }
    
    var overview: String {
        return dataForDisplay.overview ?? ""
    }
    
    init(movie: Movie) {
        self.dataForDisplay = movie
    }
    
    func getImageUrl() -> URL? {
        guard let imageName = dataForDisplay.poster_path else { return nil }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageName)") else { return nil }
        return url
    }
    
    func getMovieImage(complition: @escaping () -> ()) {
        guard let url = getImageUrl() else { return }

       
    }
}
