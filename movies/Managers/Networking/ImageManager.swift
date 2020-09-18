//
//  ImageManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class ImageManager: ImageManagerType {
    func loadImage(from url: URL?, complition: @escaping (Result<UIImage, Error>) -> ()) {
        let session = URLSession(configuration: .default)
        guard let url = url else {
            return
        }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(.failure(error))
            }
            
            if let data = data {
                let image = UIImage(data: data)
                guard let imageResult = image else {
                    return // TODO add default image
                }
                complition(.success(imageResult))
            }
        }
        
        dataTask.resume()
    }
}
