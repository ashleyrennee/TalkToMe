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
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
        signInButton.layer.borderWidth = Dimensions.brdrWidth
        emailTextField.layer.borderWidth = Dimensions.brdrWidth
        passwordTextField.layer.borderWidth = Dimensions.brdrWidth
        
        signInButton.layer.cornerRadius = Dimensions.brdrRadius
        passwordTextField.layer.cornerRadius = Dimensions.brdrRadius
        emailTextField.layer.cornerRadius = Dimensions.brdrRadius
        
        signInButton.layer.borderColor = Color.darkPurpleColor
        passwordTextField.layer.borderColor = Color.darkPurpleColor
        emailTextField.layer.borderColor = Color.darkPurpleColor
        
        
        
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

