//
//  ChatViewController.swift
//  FirebaseLogin
//
//  Created by Karan Gandhi on 3/25/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.hidesBackButton = true
        title = "Chat Screen"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func logOutPressed(_ sender: Any) {
        
   
    do {
      try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
        
        
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
        
    }
}
