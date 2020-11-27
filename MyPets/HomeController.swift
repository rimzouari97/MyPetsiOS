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
    
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func authenticate (user : String  , password:String){
        
        AF.request("http://192.168.1.4:3000/").response { response in
            print("Response: \(response)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authenticate(user: "kk", password: "ddd")
    }
    
}
