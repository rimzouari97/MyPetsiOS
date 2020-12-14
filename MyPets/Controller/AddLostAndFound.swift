//
//  AddAnimal.swift
//  MyPets
//
//  Created by rim on 12/7/20.
//

import Alamofire
import UIKit

class AddLostAndFound : UIViewController{
    
    static var type :String?
    
    @IBOutlet weak var status: UITextView!
    @IBOutlet weak var urlImage: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    @IBAction func uploadBtn(_ sender: Any) {
    }
    
    @IBAction func AddAnimal(_ sender: Any) {
        addLostAndFound(status: status.text!, urlImage: urlImage.text!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(AddLostAndFound.type)
    }
    
    
    func  addLostAndFound (status : String  , urlImage:String) {
        let id = UserDefaults.standard.string(forKey: "id")
        
        let  data : [String:Any] = ["Desc" : status, "Image": urlImage,"IdUser" : id,"Type": AddLostAndFound.type!,"valide":"false"]
    
        AF.request(BASE_URL+"lostAndFound/add", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let lostR = LostAndFoundResponse(JSONString: "\(responseString)")
                if((lostR?.success!) != false){
                    let lost = lostR?.LostAndFound
                    print(lost!)
                    if((AddLostAndFound.type?.elementsEqual("Lost")) != nil){
                        ViewController.ListLost()
                        
                    }else{
                        ViewController.ListFound()
                    }
 
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
}
