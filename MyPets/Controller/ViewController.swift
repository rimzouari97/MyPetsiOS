//
//  ViewController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit


class ViewController: UIViewController {

   
   
    
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: "nil")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
    }
   
   
}
