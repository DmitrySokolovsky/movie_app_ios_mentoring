//
//  File.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

enum MovieRequests {
    case all
    
    var request: HTTPRequest {
        return HTTPRequest(method: .get)
    }
}
