//
//  SignUpViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - views
    var label: UILabel = {
        let l = UILabel()
        l.text = "SignUp"
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
    }

}
