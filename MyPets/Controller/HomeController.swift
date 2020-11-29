//
//  HomeController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit



class HomeController : UIViewController {
    
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    var conn = Authentification()
    
    @IBAction func Login(_ sender: Any) {
        let res = conn.authenticate(email: Email.text! ,password: Password.text! )
        if(res){
        performSegue(withIdentifier: "mainHomeSegue", sender: "nil")
        }
        else{
            
        }
    }
    
    
    @IBAction func Register(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegue", sender: "nil")
    }
    
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // authenticate(user: "kk", password: "ddd")
    }
    
}
