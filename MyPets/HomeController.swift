//
//  HomeController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit
import Alamofire


class HomeController : UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    
    @IBAction func Login(_ sender: Any) {
        performSegue(withIdentifier: "mainHomeSegue", sender: "nil")
    }
    
    @IBAction func Register(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegue", sender: "nil")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mainHomeSegue"){
            //appelle méthode service web d'authentification
            
        }
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
