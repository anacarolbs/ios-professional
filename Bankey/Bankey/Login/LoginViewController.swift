//
//  ViewController.swift
//  Bankey
//
//  Created by Ana Carolina Barbosa de Souza on 06/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

    extension LoginViewController {
        private func style() {
            loginView.translatesAutoresizingMaskIntoConstraints = false
            
            signInButton.translatesAutoresizingMaskIntoConstraints = false
            signInButton.configuration = .filled()
            signInButton.configuration?.imagePadding = 8 // for indicatio spacing
            signInButton.setTitle("Sign In", for: [])
            signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
            
            errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            errorMessageLabel.textAlignment = .center
            errorMessageLabel.textColor = .systemRed
            errorMessageLabel.numberOfLines = 0
            errorMessageLabel.text = "Error failure"
            errorMessageLabel.isHidden = true
        }
        
        private func layout() {
            view.addSubview(loginView)
            view.addSubview(signInButton)
            view.addSubview(errorMessageLabel)
           
            //LoginView
            NSLayoutConstraint.activate([
                loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            ])
            
        //Button
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
                signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            ])
            
            // ErrorLabel
            NSLayoutConstraint.activate([
                errorMessageLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
                errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
                
            ])
        
        }
    }
//MARK: Actions
    extension LoginViewController {
        @objc func signInTapped(sender: UIButton){
            errorMessageLabel.isHidden = true
            login()
        }
        
        private func login() {
            guard let username = username, let password = password else {
                assertionFailure("Username / password should never be nil")
                return
            }
            if username.isEmpty || password.isEmpty { // || = or
                configureView(withMessage: "Username / password cannot be blank")
                return 
            }
            if username == "Kevin" && password = "Welcome" {
                signInButton.configuration?.showsActivityIndicator = true
            } else {
                configureView(wuthMessage: "Incorrect username / password")
            }
        }
        
        private func configureView(wuthMessage message: String) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message 
        }
    }
}
