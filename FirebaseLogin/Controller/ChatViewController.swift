//
//  ChatViewController.swift
//  FirebaseLogin
//
//  Created by Karan Gandhi on 3/25/21.
//

import UIKit
import Firebase


//tableView.dataSource = self
//dequeReusableCell


class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var messages : [Message] = [
    
        Message(sender: "1@2.com", body: "hi"),
        Message(sender: "2@1.com", body: "hey")
    
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        title = "Chat Screen"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutPressed(_ sender: Any) {
    
   
    do {
      try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
        
        
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
        
    }
}


extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return messages.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
        
        
    }
    
    
    
}
