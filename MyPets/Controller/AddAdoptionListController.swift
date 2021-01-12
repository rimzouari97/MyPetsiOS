//
//  AddAdoptionListController.swift
//  MyPets
//
//  Created by rim on 12/15/20.
//

import Foundation
import UIKit
import Alamofire

class AddAdoptionListController: UIViewController {
    
    var id :String?
    var name : String?
    var image :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameAnimalAdotion.text = name!
    }
    
    
    @IBOutlet weak var NameAnimalAdotion: UILabel!
    @IBOutlet weak var imagAdoption: UIImageView!
    
    @IBOutlet weak var AdoptionDesc: UITextView!
    
    
    @IBAction func AddAdoption(_ sender: Any) {
        addAdoption(desc: AdoptionDesc.text!)
        
    }
    
    func  addAdoption(desc : String) {
        let idu = UserDefaults.standard.string(forKey: "id")
        
        let  data : [String:Any] = ["IdAnimal" : id, "Image": image,"IdUser" : idu,"nameAnimal": name,"Description":desc,"valide":false]
    
        AF.request(BASE_URL+"adoption/add", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let adoption = AdoptionResponse(JSONString: "\(responseString)")
                if((adoption?.success!) != false){
                    let adop = adoption?.adoption
                    print(adop!)
                    MainHomeController.ListAdoption()
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let profileAnimal = storyBoard.instantiateViewController(withIdentifier: "ProfileAnimal") as! ProfileAnimal
                    profileAnimal.name = self.name!
                    profileAnimal.id = self.id!
                   //profileAnimal.image = self.image!
                    self.present(profileAnimal, animated:true, completion:nil)
 
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
    
    
}
