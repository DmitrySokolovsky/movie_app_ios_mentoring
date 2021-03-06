//
//  SignUpViewController.swift
//  movies
//
//  Created by Dzmitry  Sakalouski  on 10.01.21.
//  Copyright © 2021 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - properties
    var onCompleteSignUp: (() -> Void)?
    var onLeaveScreen: (() -> Void)?
    // MARK: - views
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "Registration"
        return l
    }()
    
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
    
    private lazy var confirmPasswordTextField: UITextField = {
        let confirmPasswordTF = UITextField()
        confirmPasswordTF.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        confirmPasswordTF.borderStyle = .roundedRect
        return confirmPasswordTF
    }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .systemRed
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleSignUpPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onLeaveScreen?()
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
        
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.anchor(top: passwordTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
            paddingTop: 25, paddingLeft: 25, paddingRight: 25)
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: confirmPasswordTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 25, paddingRight: 25, height: 40)
    }
    
    @objc private func handleSignUpPress(sender: UIButton) {
        print("SIGN")
    }

}
