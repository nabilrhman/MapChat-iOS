//
//  WelcomeViewController.swift
//  mapchat
//
//  Created by Nabil Rahman on 12/5/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true

    }
    
    //MARK: IBActions

    @IBAction func loginButtonPressed(_ sender: Any) {
        dismissKeyboard()
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
        dismissKeyboard()
    }
    
    
    
    //MARK: HelperFunctions
    func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    func cleanTextFields() {
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
    
}
