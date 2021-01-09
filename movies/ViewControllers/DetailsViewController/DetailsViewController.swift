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
    lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    lazy var scrollConainer: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.bounces = false
        return sv
    }()
    
    var stack: UIStackView = {
        let s = UIStackView()
        s.spacing = 0
        s.alignment = .top
        s.axis = .vertical
        return s
    }()
    
    var mainMovieImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
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
        view.backgroundColor = .white
        
        view.addSubview(scrollConainer)
        
        scrollConainer.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: view.frame.height)
        
        scrollConainer.addSubview(stack)
        stack.anchor(top: scrollConainer.topAnchor, left: scrollConainer.leftAnchor, bottom: scrollConainer.bottomAnchor, right: scrollConainer.rightAnchor)
        
        stack.addArrangedSubview(mainMovieImage)
        mainMovieImage.anchor(width: self.view.frame.width, height: 500)
        
        stack.addArrangedSubview(titleLabel)
        
//        scrollConainer.addSubview(container)
//        container.anchor(top: scrollConainer.topAnchor, left: scrollConainer.leftAnchor, right: scrollConainer.rightAnchor)
//
//        container.addSubview(mainMovieImage)
//        mainMovieImage.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, height: 500)
//
//        container.addSubview(titleLabel)
//        titleLabel.anchor(top: mainMovieImage.bottomAnchor, left: container.leftAnchor)
    }

}
