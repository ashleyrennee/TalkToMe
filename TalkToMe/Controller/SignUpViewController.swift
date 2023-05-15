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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = Color.brdrColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = Color.brdrColor
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if let email = emailTextField.text ,let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error{
                    print("Error:\(err.localizedDescription)")
                    self.errorLabel.text = err.localizedDescription
                }else{
                    self.performSegue(withIdentifier: "SignedUp", sender: self)
                }
            }
        }
    }
    
}
