//
//  NetworkManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerType {
    func makeRequest<T: Decodable>(endpoint: EndpointType, complition: @escaping (Result<T, Error>) -> ()) {
        let session = URLSession(configuration: .default)
        guard let request = buildRequest(endpoint: endpoint) else {
            fatalError("Cannot build request")
        }
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                complition(.failure(error))
            }
            
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(T.self, from: data)
                    complition(.success(responseData))
                } catch let error {
                    complition(.failure(error))
                }
            }
        }
        
        dataTask.resume()
    }
    
    private func buildRequest(endpoint: EndpointType) -> URLRequest? {
        var components = URLComponents(string: BASE_URL)
        components?.path = endpoint.path
        components?.queryItems = endpoint.parameters
        
        guard let urlComponents = components else { return nil }
        guard let url = urlComponents.url else { return nil }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        
        return urlRequest
    }
}
