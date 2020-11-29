//
//  Authenticate.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit
class Authenticate: UIViewController {
    
   let conn = Authentification()
  
  
    

    
    
    
    
    @IBAction func login(_ sender: Any) {
     var res = conn.authenticate(email: <#T##String#>, password: <#T##String#>)
        
        performSegue(withIdentifier: "home", sender: "nil")
    }
    
    
    @IBAction func joinus(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: "nil")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
