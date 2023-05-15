//
//  SignInViewController.swift
//  TalkToMe
//
//  Created by Ashley Acevedo on 12/20/22.
//

import UIKit
import FirebaseAuth


class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
        emailTextField.layer.borderWidth = 1
        passwordTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = Color.brdrColor
        passwordTextField.layer.borderColor = Color.brdrColor
        
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let err = error{
                    print(err.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "SignedIn", sender: self)
                }
            }
        }
    }
    
    @IBAction func dontHaveAccountPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "CreateAccount", sender: self)
    }
    
    
}

