//
//  ViewController.swift
//  MyPets
//
//  Created by rim on 11/20/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
   
    
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: "nil")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ListFound()
        ListLost()
        
    }
    
    func  ListFound () {
        
     //   let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"lostAndFound/getFound", method: .post,  encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let Found = ListLostAndFound(JSONString: "\(responseString)")
                if((Found?.success!) != false){
                let foundR = Found?.LostAndFound
                   // print(foundR?.count)
                  //  self.Data=foundR!
                    for found in foundR! {
                        print(found)
                        FoundController.Data.append(found)
                    }
                   // print(self.Data.count)
                   // self.performSegue(withIdentifier: "signUp", sender: "nil")
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
    func  ListLost () {
        
     //   let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"lostAndFound/getLost", method: .post,  encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let Found = ListLostAndFound(JSONString: "\(responseString)")
                if((Found?.success!) != false){
                let lostR = Found?.LostAndFound
                   // print(foundR?.count)
                  //  self.Data=foundR!
                    for lost in lostR! {
                        print(lost)
                        LostController.Data.append(lost)
                    }
                   // print(self.Data.count)
                   // self.performSegue(withIdentifier: "signUp", sender: "nil")
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
   
   
}
