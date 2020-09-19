//
//  MovieCellViewModelType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/19/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol MovieCellViewModelType {
    var title: String { get }
    var image: UIImage? { get }
    var imageManager: ImageManagerType? { get }
    func getMovieImage(complition: @escaping () -> ()) -> ()
}
