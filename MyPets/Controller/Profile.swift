//
//  Profile.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit

class Profile: UIViewController{
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    
   
    @IBOutlet weak var UploadImage: UITextField!
    
    @IBAction func UploadButton(_ sender: UIButton) {
    }
    
    
    @IBAction func MyProfileBtn(_ sender: Any) {
        performSegue(withIdentifier: "myProfile", sender: "nil")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let type = UserDefaults.standard.string(forKey: "type")
        print(type!)
        
    }
    
    
}
