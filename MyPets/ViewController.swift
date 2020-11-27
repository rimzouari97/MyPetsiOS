//
//  ViewController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit


class ViewController: UIViewController {

   
    @IBAction func test(_ sender: Any) {
        performSegue(withIdentifier: "test", sender: "nil")
    }
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: "nil")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="test") {
            
        }else if (segue.identifier=="login"){
            
        }
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
    }
   
   
}
