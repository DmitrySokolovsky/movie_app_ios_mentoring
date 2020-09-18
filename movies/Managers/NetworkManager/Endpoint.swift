//
//  Endpoint.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

struct Endpoint: EndpointType {
    var baseUrl: String = BASE_URL
    
    var path: String
    
    var parameters: [URLQueryItem]
    
    var method: String
}
