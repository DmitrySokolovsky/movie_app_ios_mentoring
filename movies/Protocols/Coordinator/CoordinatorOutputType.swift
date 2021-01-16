//
//  EntryCoordinatorOutputType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 16.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol CoordinatorOutputType: class {
    var finishFlow: (() -> Void)? { get set }
}
