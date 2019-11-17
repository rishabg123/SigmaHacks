//
//  ViewController.swift
//  SigmaHacks(studyApp)
//
//  Created by Rishab Gupta on 11/16/19.
//  Copyright © 2019 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Auth.auth().addStateDidChangeListener { (auth, user) in
            let currentUser = Auth.auth().currentUser
            
            if currentUser != nil{
                //there is a user signed in(perform segue to home screen of app)
                
                self.performSegue(withIdentifier: "welcome", sender: self)
            }

        }
    }

    @IBAction func signIn(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: self)
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
   
  
}

