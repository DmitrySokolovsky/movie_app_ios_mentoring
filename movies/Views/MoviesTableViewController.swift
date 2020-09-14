//
//  MoviesTableViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/13/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    private var viewModel: MovieTableViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        viewModel = MovieTableViewModel()
        tableView.register(MovieViewCell.self, forCellReuseIdentifier: "movieCell")
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        viewModel?.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        
        return viewModel.numberOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieViewCell

        guard let viewModel = viewModel else {
            return UITableViewCell()
        }

        
        let cellVM = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellVM

        return cell
    }

}
