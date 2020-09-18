//
//  NetworkManagerType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol NetworkManagerType {
    func makeRequest<T: Decodable>(endpoint: EndpointType, complition: @escaping (Result<T, Error>) -> ()) -> ()
}
