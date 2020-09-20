//
//  DetailsViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/19/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var viewModel: MovieDetailsViewModelType?
    
    var scrollConainer: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    var container: UIView = {
        let v = UIView()
        return v
    }()
    
    var mainMovieImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var titleLabel: UILabel = {
        let tl = UILabel()
        return tl
    }()
    
    var overviewLabel: UILabel = {
        let ol = UILabel()
        return ol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureView()
        
        guard let viewModel = viewModel else { return }
        viewModel.getMovieDetails { [unowned self] in
            self.titleLabel.text = viewModel.movieDetails?.title
            
            viewModel.getMovieImage { image in
                self.mainMovieImage.image = image
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.backButtonTitle = .none
    }
    
    private func configureView() -> () {
        view.addSubview(scrollConainer)
        scrollConainer.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            scrollConainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollConainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollConainer.topAnchor.constraint(equalTo: view.topAnchor),
            scrollConainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollConainer.addSubview(container)
        container.anchor(top: scrollConainer.topAnchor, left: scrollConainer.leftAnchor, right: scrollConainer.rightAnchor)
                
        container.addSubview(mainMovieImage)
        mainMovieImage.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, height: 500)
        
        container.addSubview(titleLabel)
        titleLabel.anchor(top: mainMovieImage.bottomAnchor, left: container.leftAnchor, paddingTop: 1000)
    }

}
