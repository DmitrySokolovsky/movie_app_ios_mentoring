//
//  ViewControllerFactoryType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 8.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerFactoryType {
    associatedtype ViewControllerInstance
    func makeViewController(controller: ViewControllerInstance) -> UIViewController
}
