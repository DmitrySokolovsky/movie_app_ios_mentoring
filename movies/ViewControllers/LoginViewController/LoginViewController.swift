//
//  LoginViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - views
    private lazy var loginTextField: UITextField = {
        let loginTF = UITextField()
        return loginTF
    }()
    
    var label: UILabel = {
        let l = UILabel()
        l.text = "Login"
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
    }

}
