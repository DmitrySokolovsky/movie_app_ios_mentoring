//
//  EndpointType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol EndpointType {
    var path: String { get }
    
    var parameters: [URLQueryItem] { get set }
    
    var method: HTTPMethod { get }
}
