//
//  MovieViewCell.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 9/14/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    // MARK: - view cell items
    
    weak var viewModel: MovieCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            viewModel.getMovieImage { [weak self] in
                self?.movieImage.image = viewModel.image
            }
        }
    }

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        return label
    }()
    
    var movieImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        return view
    }()
    
    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(containerView)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        containerView.addSubview(movieImage)
        movieImage.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: bottomAnchor, width: 150, height: 200)
        
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.topAnchor, left: movieImage.rightAnchor, paddingTop: 10, paddingLeft: 10)
        
        updateFocusIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
