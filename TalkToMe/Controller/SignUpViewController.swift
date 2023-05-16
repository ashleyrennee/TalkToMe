//
//  SignUpViewController.swift
//  TalkToMe
//
//  Created by Ashley Acevedo on 12/20/22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.borderWidth = Dimensions.brdrWidth
        emailTextField.layer.borderWidth = Dimensions.brdrWidth
        passwordTextField.layer.borderWidth = Dimensions.brdrWidth
        
        signUpButton.layer.cornerRadius = Dimensions.brdrRadius
        passwordTextField.layer.cornerRadius = Dimensions.brdrRadius
        emailTextField.layer.cornerRadius = Dimensions.brdrRadius
        
        signUpButton.layer.borderColor = Color.darkPurpleColor
        passwordTextField.layer.borderColor = Color.darkPurpleColor
        emailTextField.layer.borderColor = Color.darkPurpleColor
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let email = emailTextField.text ,let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error{
                    self.errorLabel.text = err.localizedDescription
                }else{
                    self.performSegue(withIdentifier: "SignedUp", sender: self)
                }
            }
        }
    }
    
}
