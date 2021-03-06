//
//  MoviesTableViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    // MARK: - properties
    var viewModel: MovieTableViewModelType?
    var onMoviePress: ((MovieDetailsViewModelType) -> Void)?

    // MARK: - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieViewCell.self, forCellReuseIdentifier: "movieCell")
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        viewModel?.fetchMovies(page: 1) { [weak self] in // TODO remove int value
            if let errorMessage = self?.viewModel?.errorMessage {
                self?.tableView.headerView(forSection: 0)?.textLabel?.text = errorMessage
                return
            }
            
            self?.tableView.reloadData()
        }
    }
}

extension MoviesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int { // TODO = extensions
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieViewCell
        if let tableCell = cell {
            guard let viewModel = viewModel else {
                return UITableViewCell()
            }
            
            let cellVM = viewModel.cellViewModel(forIndexPath: indexPath)
            tableCell.viewModel = cellVM

            return tableCell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        let viewModelForSelectedRow = viewModel.viewModelForSelectedRow()
    }
}
