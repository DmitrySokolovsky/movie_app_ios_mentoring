//
//  NetworkManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

class NetworkManager<T: Decodable> {
    static func get(urlString: String, complition: @escaping (_ data: Decodable) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                complition(result)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    static func loadImage(_ url: URL, complition: @escaping (UIImage) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                complition(image)
                return
            }
        }.resume()
    }
}
