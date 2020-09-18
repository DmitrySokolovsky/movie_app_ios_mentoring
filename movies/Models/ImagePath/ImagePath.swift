//
//  ImagePath.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class ImagePath: ImagePathType {
    var baseImageUrl: String = BASE_IMAGE_URL

    func getImageUrl(for imageName: String) -> URL? {
        let urlString = "\(baseImageUrl)\(imageName)"
        return URL(string: urlString)
    }
}
