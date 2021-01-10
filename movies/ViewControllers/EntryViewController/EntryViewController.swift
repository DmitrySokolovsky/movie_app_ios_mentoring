//
//  EntryViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    // MARK: - views
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .medium)
        ai.color = .black
        return ai
    }()
    
    lazy var container: UIView = {
        let v = UIView()
        return v
    }()
    
    // MARK: - lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - UI configuration
    
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(container)
        container.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        container.addSubview(activityIndicatorView)
        activityIndicatorView.anchor(width: 50, height: 50)
        activityIndicatorView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        activityIndicatorView.startAnimating()
    }

}
