//
//  Authenticate.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit
class Authenticate: UIViewController {
    
    
    @IBAction func email(_ sender: Any) {
    }
    
    @IBAction func password(_ sender: Any) {
    }
    
    
    @IBAction func login(_ sender: Any) {
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
