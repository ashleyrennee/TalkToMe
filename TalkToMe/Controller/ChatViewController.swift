//
//  ChatViewController.swift
//  TalkToMe
//
//  Created by Ashley Acevedo on 12/20/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


class ChatViewController: UIViewController
{
    @IBOutlet weak var messageInputTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    var messages : [Message] = []
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageInputTextField.layer.borderWidth = Dimensions.brdrWidth
        messageInputTextField.layer.cornerRadius = Dimensions.brdrRadius
        messageInputTextField.layer.borderColor = Color.darkPurpleColor
        navigationItem.hidesBackButton = true
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        populateMessages()
    }
    
    
    func populateMessages(){
        db.collection("Messages").order(by: "Date").addSnapshotListener
        { querySnapshot, error in
            self.messages = []
            
            if let err = error{
                print(err.localizedDescription)
            }else{
                if let docs = querySnapshot?.documents{
                    for doc in docs{
                        let messageData = doc.data()
                        if let textSender = doc["Sender"] as? String, let textBody = doc["textBody"] as? String{
                            let currMessage = Message(sender: textSender, textBody: textBody)
                            self.messages.append(currMessage)
                            DispatchQueue.main.async {
                                self.chatTableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.chatTableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendMessagePressed(_ sender: UIButton) {
        if let text = messageInputTextField.text ,let textSender = Auth.auth().currentUser?.email {
            db.collection("Messages").addDocument(data: ["Sender":textSender, "textBody" : text, "Date": Date().timeIntervalSince1970]) { (error) in
                if let err = error{
                    print(err.localizedDescription)
                }else{
                    print("data saved")
                    DispatchQueue.main.async{
                        self.messageInputTextField.text = ""
                    }
                }
            }
        }
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
extension ChatViewController: UITableViewDataSource{
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
      
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.textBody.text = message.textBody
        cell.currUserLabel.text = message.sender
    
        return cell
    }
}


