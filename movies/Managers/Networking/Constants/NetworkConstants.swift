//
//  NetworkConstants.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

let API_KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String // ???
let BASE_URL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
let BASE_IMAGE_URL = Bundle.main.object(forInfoDictionaryKey: "BASE_IMAGE_URL") as! String

var defaultParams: [URLQueryItem] = [
    URLQueryItem(name: "api_key", value: API_KEY),
    URLQueryItem(name: "language", value: "en-US"),
]
