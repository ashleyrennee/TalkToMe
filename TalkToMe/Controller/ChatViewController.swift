//
//  ChatViewController.swift
//  TalkToMe
//
//  Created by Ashley Acevedo on 12/20/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class ChatViewController: UIViewController
{
    @IBOutlet weak var messageInputTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        //chatTableView.dataSource = self
    }
    
    
    @IBAction func sendMessagePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

//MARK: UITableViewDataSource
//extension ChatViewController: UITableViewDataSource{
  
   // @IBAction func sendMessagePressed(_ sender: UIButton) {
    //}
   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //      return section
  //  }
    
  //  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // return indexPath.row(section)
   // }
    
//}
