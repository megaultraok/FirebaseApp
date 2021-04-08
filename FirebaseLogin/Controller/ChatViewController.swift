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

    
    let db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    
    
    var messages : [Message] = [
    
    ]
   
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        title = "Chat Screen"
        // Do any additional setup after loading the view.
        loadData()
    }
    func loadData() {
        
        

               db.collection("NewMessages").order(by: "date").addSnapshotListener { (querySnapshot, error) in

                   

                   

                   self.messages = []

                   if let e = error {

                       print("Unable to retrieve")

                   }

                   

                   else {

                       

                       if let snapshotDocuments = querySnapshot?.documents{

                         

                           for doc in snapshotDocuments {

                               

                               print(doc.data())

                               

                               let data = doc.data()

                               

                               if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String

                               {

                                   

                                   let newMessage = Message(sender: messageSender, body: messageBody)

                                   

                                   self.messages.append(newMessage)

                                       

                                       

                                   self.tableView.reloadData()

                                       

                                   

                               }

                           }

                       }
                   }

        
               }
        
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        
        if let messagSender = Auth.auth().currentUser?.email,   let messageBody = textField.text

              

           

              {

                  

                  

                  db.collection("NewMessages").addDocument(data: [



                      "sender" : messagSender,

                      "body" : messageBody,

                      "date" : Date().timeIntervalSince1970

                  

                  

                  ]) { (error) in

                      

                      

                      

                      if let e = error {

                          

                          print("Unsuccessful")

                      }

                      

                      else {

                          

                          print("Successful")

                      }

                      

                  }

                  

                  

                  

                  

                  

                  

              }

              

              

              
        
        
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
