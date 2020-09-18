//
//  ImagePathType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/18/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol ImagePathType {
    var baseImageUrl: String { get }
    func getImageUrl(for imageName: String) -> URL?
}
