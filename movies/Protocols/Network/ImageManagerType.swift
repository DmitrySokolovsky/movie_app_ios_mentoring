//
//  ImageManagerType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol ImageManagerType {
    func loadImage(from url: URL?, complition: @escaping (Result<UIImage?, Error>) -> ())
}
