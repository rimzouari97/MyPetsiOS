//
//  ProfileAnimal.swift
//  MyPets
//
//  Created by rim on 12/15/20.
//

import Foundation
import UIKit
import Alamofire

class ProfileAnimal : UIViewController {
    
     var id :String?
     var name : String?
     var image :String?
     var race : String?
     var type : String?
    
    @IBOutlet weak var picture: UIImageView!

    @IBAction func btntrash(_ sender: Any) {
        deleteAnimal(id : id!)
    }
    
    
    @IBAction func btnAdoption(_ sender: Any) {
        print("adoption")
        performSegue(withIdentifier: "mSegueAdoption", sender: "nil")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
       let destionation = segue.destination as! AddAdoptionListController
        print(name!)
        destionation.name = name
        destionation.id = id
       // destionation.image = image

    }
    
    @IBOutlet weak var desc: UITextView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      print(name!)
      desc.text = "Name" + name!  // + " \n Name" + animal?.Name! + "\n Type" + animal?.Type!
        
    }
    
     func  deleteAnimal (id : String) {
        
        let  data : [String:Any] = ["id" : id]
        AF.request(BASE_URL+"animal/delete", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                //   print(responseString)
                let animals = AnimalsResponse(JSONString: "\(responseString)")
                if((animals?.success!) != false){
                
                    MyAnimals.ListAnimals()
                 //   print(MyAnimals.Data	)
                    self.performSegue(withIdentifier: "deleteAnimal", sender: nil)
                    
                }
                case .failure(let error):
                   print(error)
               }

           }
}
    
    
   
}
