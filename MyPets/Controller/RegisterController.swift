//
//  Register.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit

 class RegisterController : UIViewController{
    
    @IBAction func signup(_ sender: Any) {
        
        performSegue(withIdentifier: "signUp", sender: "nil")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
    }
    
}
