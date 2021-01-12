//
//  AddAnimal.swift
//  MyPets
//
//  Created by rim on 12/13/20.
//

import Foundation
import UIKit
import Alamofire

class AddAnimal : UIViewController, UITableViewDelegate,UITableViewDataSource {

    var ListType = [ "cat", "dog", "bird"]
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var DropDown: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var types: UITableView!
    @IBOutlet weak var race: UITextField!
    @IBOutlet weak var uploadImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        types.isHidden = true
        lbl.isHidden = true
        lbl.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Upload(_ sender: Any) {
    }
    
    @IBAction func OnClickDropDown(_ sender: Any) {
        if types.isHidden{
            animate(toggle: true, type: DropDown)
        } else {
            animate(toggle: false, type: DropDown)
        }
    }
    
    @IBAction func AddAnimal(_ sender: Any) {
        addAnimal(Name: name.text!, Type: "cat", Race: race.text!, Image: "uploadImage")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListType.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"typeCell")
        cell?.textLabel?.text = ListType[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DropDown.setTitle("\(ListType[ indexPath.row])", for: .normal)
        animate(toggle:false,type:DropDown)
    }
    func animate (toggle: Bool , type: UIButton){
        if type == DropDown {
        
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.types.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.types.isHidden = true
            }
        }
        } else {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.lbl.isHidden = true
                }
            }
        }
    }
    
    func  addAnimal (Name : String  , Type:String, Race:String, Image: String) {
        let id = UserDefaults.standard.string(forKey: "id")
        print(id)
        
        let  data : [String:Any] = ["Name" : Name, "Image": Image,"IdUser" : id,"Type": Type,"Race":Race]
    
        AF.request(BASE_URL+"animal/add", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let animalR = AnimalsResponse(JSONString: "\(responseString)")
                if((animalR?.success!) != false){
                    let anim = animalR?.Animal
                    MyAnimals.ListAnimals()
                    print(animalR!)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let found = storyBoard.instantiateViewController(withIdentifier: "MyAnimals") as! MyAnimals
                    self.present(found, animated: true, completion: nil)
                 
                    
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
 
}
    

