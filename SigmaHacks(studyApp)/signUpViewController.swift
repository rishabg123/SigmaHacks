//
//  signUpViewController.swift
//  SigmaHacks(studyApp)
//
//  Created by Rishab Gupta on 11/16/19.
//  Copyright © 2019 Rishab Gupta. All rights reserved.
//

import UIKit
import Firebase

class signUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signUpPressed(_ sender: Any) {
        // error handling here
        let count = passwordTextField.text?.count
        
        if emailTextField.text == nil{
            let alert = UIAlertController(title: "Enter an Email", message: "Please Enter an Email", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default))
                       present(alert, animated: true, completion: nil)
                       return
        }
        else if usernameTextField.text == nil{
            let alert = UIAlertController(title: "Enter an Username", message: "Please Enter a Username", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    present(alert, animated: true, completion: nil)
        return
        }
        
        else if passwordTextField.text == nil{
            let alert = UIAlertController(title: "Enter a Password", message: "Please Enter a Password", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "Ok", style: .default))
                      present(alert, animated: true, completion: nil)
                      return
        }
        
        else if count! < 6{
            let alert = UIAlertController(title: "Password Must Be Longer than 6 characters", message: "Please enter a password longer than 6 characters", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: .default))
                       present(alert, animated: true, completion: nil)
                       return
        }
        
        else if isValidEmail(emailStr: emailTextField.text!) == false{
                  let alert = UIAlertController(title: "Badly Formatted Email", message: "The email you have entered is badly formatted", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Ok", style: .default))
                  present(alert, animated: true, completion: nil)
                  return
              }
        
        
        
        
        
        // firebase stuff here
        let formattedEmail = emailTextField.text?.replacingOccurrences(of: ".", with: "")
        
        let databaseRef = Database.database().reference().child("users/\(formattedEmail!)")
        let storage = Storage.storage()

        
        let userInfoDict:[String:String] = ["Email": "\(emailTextField.text!)", "mUsername": "\(usernameTextField.text!)"]
        
        databaseRef.setValue(userInfoDict)
        
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                // an error occured. Handle Here...
            }
            else{
                self.performSegue(withIdentifier: "signIn", sender: self)
            }
        }
        
    }
   
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[\\w.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
          
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: emailStr)
      }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
}
