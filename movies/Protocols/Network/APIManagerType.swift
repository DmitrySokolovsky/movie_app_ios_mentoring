//
//  APIManagerType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol APIManagerType {
    associatedtype T
    var networkManager: NetworkManagerType? { get }
    func makeAPICall<U: Decodable>(with httpRequestInstance: T, decodeType: U.Type, complition: @escaping (HTTPResult<U>) -> ()) -> ()
}
