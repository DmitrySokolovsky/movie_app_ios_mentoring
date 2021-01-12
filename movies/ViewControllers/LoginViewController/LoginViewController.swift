//
//  LoginViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - properties
    private var navigator: AuthNavigator! // if i add Navigator as type - I've got an error "Protocol 'Navigator' can only be used as a generic constraint because it has Self or associated type requirements"
    
    // MARK: - views
    private lazy var loginTextField: UITextField = {
        let loginTF = UITextField()
        loginTF.attributedPlaceholder = NSAttributedString(string: "Email",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        loginTF.borderStyle = .roundedRect
        return loginTF
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTF = UITextField()
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTF.borderStyle = .roundedRect
        return passwordTF
    }()
    
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "Welcome"
        return l
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .systemRed
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleLoginPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var sighUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSignUpPress))
        label.addGestureRecognizer(tapRecognizer)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigator = AuthNavigator(navigationController: navigationController!)
        
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.anchor(top: view.topAnchor, paddingTop: 90)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginTextField)
        loginTextField.anchor(top: label.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 25, paddingRight: 25)
        
        view.addSubview(passwordTextField)
        passwordTextField.anchor(top: loginTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
            paddingTop: 25, paddingLeft: 25, paddingRight: 25)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 25, paddingRight: 25, height: 40)
        
        view.addSubview(sighUpLabel)
        sighUpLabel.anchor(bottom: view.bottomAnchor, paddingBottom: 20)
        sighUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func handleLoginPress(sender: UIButton!) {
        print("HEllo")
    }
    
    @objc func handleSignUpPress(sender: UIButton!) {
        navigator.navigate(to: .signUp)
    }
}
