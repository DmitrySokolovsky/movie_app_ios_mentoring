//
//  NavigatorType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Route
        
    func navigate(to route: Route, viewModel: Any?)
}
