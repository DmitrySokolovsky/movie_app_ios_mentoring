//
//  ImageDownloadManagerType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/16/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloadManagerType {
    associatedtype T
    var networkManager: NetworkManager? { get }
    func loadImage(with httpRequestInstance: T, completion: @escaping (HTTPResult<UIImage>) -> ()) -> ()
}
