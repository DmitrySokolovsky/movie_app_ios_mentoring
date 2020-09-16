//
//  NetworkManagerType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol NetworkManagerType {
    func makeRequest(request: URLRequest, complition: @escaping (HTTPResult<Data>) -> ()) -> ()
}
