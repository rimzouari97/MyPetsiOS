//
//  Profile.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit
import Alamofire
import SideMenu

class Profile: UIViewController{
    let userDefaults = UserDefaults.standard
    var url :String?
    
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    
   
    @IBOutlet weak var UpImage: UIImageView!
    @IBOutlet weak var UploadImage: UITextField!
    
    @IBAction func UploadButton(_ sender: UIButton) {
    }
    
    
    @IBAction func MyProfileBtn(_ sender: Any) {

        
        CreateProfile(Adresse: Address.text, telephon: PhoneNumber.text, image: UploadImage.text)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let type = UserDefaults.standard.string(forKey: "type")
        print(type!)
        
        if(type?.elementsEqual("Abris") == true){
            url = BASE_URL+"abri"
            print(url!)
        }else if(type?.elementsEqual("Veterinaires") == true){
            url = BASE_URL+"veterinaire"
            print(url!)
        }else if(type?.elementsEqual("Volontaires") == true){
            url = BASE_URL+"volontaire"
            print(url!)
        }
        
    }

    func  CreateProfile (Adresse: String?, telephon : String?  , image:String?) {
        
        let id = UserDefaults.standard.string(forKey: "id")
        
        
       // let  us : [String:Any] = ["name" : name ,"email" : email, "_id": id, "type": type]
        let  data : [String:Any] = ["IdUser": id,"Adresse" : Adresse! ,"telephon" : telephon!, "image": image!]
        userDefaults.object(forKey: "Adresse")
        userDefaults.object(forKey: "phone")
        userDefaults.object(forKey: "image")
        AF.request(url!+"/add", method: .post, parameters: data, encoding: JSONEncoding.default)
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
                    print(profil?.profile!)
                    
                    self.performSegue(withIdentifier: "myProfile", sender: "nil")
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
    
    
}
