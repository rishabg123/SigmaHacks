//
//  signInViewController.swift
//  SigmaHacks(studyApp)
//
//  Created by Rishab Gupta on 11/16/19.
//  Copyright © 2019 Rishab Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth

class signInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func signInPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if user != nil{
                               func prepare(for segue: UIStoryboardSegue, sender: Any?){
                            //    var vc = segue.destination as! homeViewController
                            //    vc.email = self.emailTextField.text!
                                
                                }
                          //        self.performSegue(withIdentifier: "welcome", sender: self)
                        self.performSegue(withIdentifier: "signedIn", sender: self)
                        
                        
                            }
                            else{
                                let alert = UIAlertController(title: "Error", message: "There was an error logging you in! Please try again!", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                                self.present(alert, animated: true)
                                return
                            }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
}
