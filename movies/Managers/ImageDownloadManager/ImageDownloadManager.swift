//
//  ImageDownloadManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class ImageDownloadManager<T: HTTPRequestType>: ImageDownloadManagerType {
    var networkManager: NetworkManager?
    
    init(_ manager: NetworkManager) {
        self.networkManager = manager
    }
    
    func loadImage(with httpRequestInstance: T, completion: @escaping (HTTPResult<UIImage>) -> ()) -> () {
        guard let networkManager = networkManager else { fatalError("Cannot make request") }
        
        networkManager.makeRequest(request: httpRequestInstance.urlRequest) { result in
            switch result {
            case .success(let imageData):
                let image = UIImage(data: imageData)
                if let loadedImage = image {
                    completion(.success(data: loadedImage))
                } else {
                    completion(.error(error: fatalError("Cannot get image")))
                }
            case .error(let error):
                completion(.error(error: error))
            }
        }
    }
}
