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
      /*  if(self.res == true){
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
 */
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
        userDefaults.object(forKey: "Adresse")
        userDefaults.object(forKey: "phone")
        userDefaults.object(forKey: "image")
        AF.request(BASE_URL+"users/auth", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let userR = UserResponse(JSONString: "\(responseString)")
                if((userR?.success!) != false){
                 self.res = true
                let user = userR?.user
                    self.userDefaults.setValue(user?.id, forKey: "id")
                    self.userDefaults.setValue(user?.name, forKey: "name")
                    self.userDefaults.setValue(user?.email, forKey: "email")
                    self.userDefaults.setValue(user?.type, forKey: "type")
                  //  print(userR?.success!)
                    self.valideProfile(id: user?.id, type: user?.type)
                    
                    
                }else{
                 
                          self.view.makeToast("Mail or Password incorrect", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                              if didTap {
                                  print("completion from tap")
                              } else {
                                  print("completion without tap")
                              }
                          }
                  
                }case .failure(let error):
                   print(error)
               }
 
           }
 
}
    
    
    func  valideProfile (id : String?,type :String?) {
        var  Url : String?
       // Url = ""
        let  data : [String:Any] = ["IdUser": id! ]
        if (type?.elementsEqual("Abris") == true){
            Url = BASE_URL+"abri"
        } else if (type?.elementsEqual("Volontaires") == true){
            Url = BASE_URL+"volontaire"
        } else if (type?.elementsEqual("Veterinaires") == true){
            Url = BASE_URL+"veterinaire"
        }
   
        AF.request(Url!+"/auth", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
                switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let profil = profileResponse(JSONString: "\(responseString)")
                if((profil?.success!) != false){
                let p = profil?.profile
                    self.userDefaults.setValue(p?.Adresse, forKey: "Adresse")
                    self.userDefaults.setValue(p?.telephone, forKey: "phone")
                    self.userDefaults.setValue(p?.image,forKey: "image")
                    print(profil!)
                    self.performSegue(withIdentifier: "mainHomeSegue", sender: "nil")
                }else{
                    //mSegueProfile
                    self.performSegue(withIdentifier: "mSegueProfile", sender: "nil")

                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
    
    
}
