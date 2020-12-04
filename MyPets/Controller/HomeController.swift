//
//  HomeController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit
import Toast_Swift
import Alamofire



class HomeController : UIViewController {
    
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
      var res = false
    
    @IBAction func Login(_ sender: Any) {
      authenticate(email: Email.text! ,password: Password.text! )
        if(self.res == true){
        performSegue(withIdentifier: "mainHomeSegue", sender: "nil")
        }
        else{
            self.view.makeToast("Mail or Password incorrect", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
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
    
    func  authenticate (email : String  , password:String) {
       let  data : [String:Any] = ["email" : email, "password": password]
        userDefaults.object(forKey: "name")
        userDefaults.object(forKey: "email")
        userDefaults.object(forKey: "password")
        userDefaults.object(forKey: "type")
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"users/auth", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let userR = UserResponse(JSONString: "\(responseString)")
                if((userR?.success!) != false){
                let user = userR?.user
                    self.userDefaults.setValue(user?.name, forKey: "name")
                    print(userR?.success!)
                    self.res = true
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
    
    
}
