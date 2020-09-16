//
//  HTTPResult.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

enum HTTPResult<T> {
    case success(data: T)
    case error(error: Error)
}
