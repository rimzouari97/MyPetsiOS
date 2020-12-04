//
//  Authentification.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import Alamofire
import Foundation

public class Authentification  {
    let userDefaults = UserDefaults.standard
   
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
                    //HomeController.res = true
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
}
