//
//  TableViewModelType.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

protocol TableViewModelType {
    associatedtype TableCellType
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableCellType?
}
