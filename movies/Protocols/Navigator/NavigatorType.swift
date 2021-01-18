//
//  NavigatorType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import UIKit

protocol NavigatorType: PresentableType {
    func present(module: PresentableType?)
    func present(module: PresentableType?, animated: Bool)
    func navigate(module: PresentableType?)
    func navigate(module: PresentableType?, animated: Bool)
    func navigate(module: PresentableType?, animated: Bool, completion: (() -> Void)?)
    func navigate(module: PresentableType?, isNavBarHidden: Bool)
    
    func setNavBarHidden(navBarHidden: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(module: PresentableType?, hideNavBar: Bool)
    func popModule()
    func popModule(animated: Bool)
    func popToRootModule(animated: Bool)
}
