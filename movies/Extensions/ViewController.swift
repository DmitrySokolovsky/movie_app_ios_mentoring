//
//  ViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerWithViewModelType {
    var viewModel: Any? { get set }
}

extension UIViewController: ViewControllerWithViewModelType {
    var viewModel: Any?
}
