//
//  ViewController.swift
//  Password
//
//  Created by Ana Carolina Barbosa de Souza on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
//    let newPasswordTextField2 = PasswordTextField(placeHolderText: "New password2")
    let criteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
//        stackView.addArrangedSubview(newPasswordTextField)
//        stackView.addArrangedSubview(newPasswordTextField2)
        stackView.addArrangedSubview(criteriaView)

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
//
//        NSLayoutConstraint.activate([
//            newPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
    }
}
