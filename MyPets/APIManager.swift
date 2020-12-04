//
//  APIManager.swift
//  MyPets
//
//  Created by rim on 12/4/20.
//

import Foundation
import Alamofire
import PromiseKit
class APIManager {
    static let shared = APIManager()
    
    private init (){
        
    }
    func fetchUserFromAPI()  {
        
        
        AF.request(BASE_URL+"users/list", method: .post, parameters: nil, encoding: JSONEncoding.default)
                // AF.request(BASE_URL+"users/list")
                     .responseString { response in
                     switch (response.result){
                     case .success(let responseString):
                        // print(responseString)
                         let listUser = ListUser(JSONString: "\(responseString)")
                        let users = listUser?.users
                        
                        
                        for us in users! {
                            print(us.name)
                        }
                        
                        print(listUser?.users?.count)
                     case .failure(let error):
                         print(error)
                       
                     }
                 }
        
       
    }
}
