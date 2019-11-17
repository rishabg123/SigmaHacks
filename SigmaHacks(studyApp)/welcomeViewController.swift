//
//  welcomeViewController.swift
//  SigmaHacks(studyApp)
//
//  Created by Rishab Gupta on 11/16/19.
//  Copyright © 2019 Rishab Gupta. All rights reserved.
// This will be the homescreen of the app once sign in is done

import UIKit
import Firebase


class welcomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var classes:[String] = ["Trigonometry", "Chemistry", "P.E", "Leadership", "English 10 Honors", "AP European History", "Spanish 2"]
    
    @IBOutlet weak var tableView:
    UITableView!
    

   
    
    var selectedIndex = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.delegate = self
        tableView.dataSource = self

    }
    

    @IBAction func signOutPressed(_ sender: Any) {
        
      do {
        try Auth.auth().signOut()
        print("success")
        performSegue(withIdentifier: "signOut", sender: self)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = classes[indexPath.row]
        
        

        return cell
       }
}

