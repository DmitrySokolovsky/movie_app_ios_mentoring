//
//  APIManager.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

class APIManager<T: HTTPRequestType>: APIManagerType {
        
    var networkManager: NetworkManagerType?
    
    init(_ manager: NetworkManager) {
        self.networkManager = manager
    }
    
    func makeAPICall<U>(with httpRequestInstance: T, decodeType: U.Type, complition: @escaping (HTTPResult<U>) -> ()) where U : Decodable {
        guard let networkService = networkManager else { return }
        
        networkService.makeRequest(request: httpRequestInstance.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(decodeType, from: data)
                    complition(.success(data: decodedData))
                } catch let error {
                    complition(.error(error: error))
                }
            case .error(let error):
                complition(.error(error: error))
            }
        }
    }
    
}
