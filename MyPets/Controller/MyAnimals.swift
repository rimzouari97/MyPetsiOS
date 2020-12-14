//
//  MyAnimals.swift
//  MyPets
//
//  Created by rim on 12/13/20.
//

import Foundation
import UIKit
import Alamofire

class MyAnimals : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    static var Data : [Animal] = []
    
    @IBAction func AddAnimal(_ sender: Any) {
        performSegue(withIdentifier: "AddAnimal", sender: "nil")
    }
    
    @IBOutlet weak var listAnimals: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyAnimals.Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"animCell")
        let contentView = cell?.contentView
        let label = contentView?.viewWithTag(2) as! UILabel
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        
        label.text = MyAnimals.Data[indexPath.row].Name
        
        imageView.image = UIImage(named: "poki")
        
        return cell!
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        listAnimals?.reloadData()   // ...and it is also visible here.
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    static func  ListAnimals () {
        
     //   let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"animal/list", method: .post,  encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let animals = ListAnimal(JSONString: "\(responseString)")
                if((animals?.success!) != false){
                let animalR = animals?.Animal
                   // print(foundR?.count)
                  //  self.Data=foundR!
                    MyAnimals.Data.removeAll()
                    for anim in animalR! {
                        print(anim)
                        MyAnimals.Data.append(anim)
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
