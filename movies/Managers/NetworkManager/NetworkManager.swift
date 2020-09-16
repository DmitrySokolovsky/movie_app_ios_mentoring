//
//  NetworkManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerType {
    private var urlSession = URLSession.shared
    
    func makeRequest(request: URLRequest, complition: @escaping(HTTPResult<Data>) -> ()) {
        urlSession.dataTask(with: request) { (data, response, error) in
            if let data = data {
                complition(.success(data: data))
            } else if let error = error {
                complition(.error(error: error))
            } else {
                return
            }
        }.resume()
    }
}
