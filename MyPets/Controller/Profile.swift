//
//  Profile.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit
import Alamofire

class Profile: UIViewController{
    let userDefaults = UserDefaults.standard
    var url = BASE_URL
    
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!
    
   
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
        
        if(type?.elementsEqual("shelter") == true){
            url.append("abri/add")
        }else if(type?.elementsEqual("veterinarian") == true){
            url.append(BASE_URL+"veterinaire/add")
        }else if(type?.elementsEqual("volunteer") == true){
            url.append(BASE_URL+"/volontaire/add")
        }
        print(url)
        
        
        
    }

    func  CreateProfile (Adresse: String?, telephon : String?  , image:String?) {
        let  data : [String:Any] = ["IdUser": UserDefaults.standard.string(forKey: "id"),"Adresse" : Adresse! ,"telephon" : telephon!, "image": image!]
        userDefaults.object(forKey: "adresse")
        userDefaults.object(forKey: "telephon")
        userDefaults.object(forKey: "image")
     //   let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(url, method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
                switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let userR = UserResponse(JSONString: "\(responseString)")
                if((userR?.success!) != false){
                let user = userR?.user
                    self.userDefaults.setValue(user?.name, forKey: "name")
                    print(userR?.success!)
                    self.performSegue(withIdentifier: "myProfile", sender: "nil")
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
    
    
}
