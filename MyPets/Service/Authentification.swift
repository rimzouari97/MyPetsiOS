//
//  Authentification.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import Alamofire


public class Authentification  {
    let BaseUrl = "http://192.168.1.13:3000/users/"
   
    init() {
        
    }
    
    func  authenticate (email : String  , password:String) -> Bool {
        var  res : Bool = true
       let  data : [String:Any] = ["email" : email, "password": password]
        var sURL : String!
        sURL = BaseUrl+"auth"
        
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        
        AF.request(sURL, method: .post, parameters: data, encoding: JSONEncoding.default).responseString(completionHandler: { response in
                    //  print(response)
            if(response.error == nil){
                var responseString: String!
                responseString = ""
                if(response.data != nil){
                    responseString = String(bytes: response.data!, encoding : .utf8)
                    
                }
                else{
                    responseString = response.response?.description
                }
                print(responseString ?? "")
                print(response.response?.statusCode)
                var responseData : NSData!
                responseData = response.data! as NSData
              //  let iDataLength = responseData.length
               // print("size :\(iDataLength) Bytes")
               // print("Response Time\(response.metrics?.taskInterval.duration ?? 0) seconds")
               
            }else{
                res = false
            }
                  })
        return res as Bool
      
}
  
 
}
