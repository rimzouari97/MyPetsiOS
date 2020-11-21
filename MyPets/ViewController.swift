//
//  ViewController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
    
    
    @IBAction func JoinUs(_ sender: Any) {
        performSegue(withIdentifier: "segueJoin", sender: "nil")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url="http://192.168.1.8:3000/"
        getDate(from: url)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueJoin"){
            
        }
    }
   func getDate(from url:String){
                AF.request(url)
                    .response{ (response) in
                    debugPrint(response)
                }
}
}
