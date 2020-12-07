//
//  FoundController.swift
//  MyPets
//
//  Created by oussama on 12/7/20.
//

import UIKit
import Alamofire
class FoundController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func AddFoundAnimal(_ sender: Any) {
        performSegue(withIdentifier: "addFoundAnimal", sender: "nil")
    }
    
    
   static var Data : [LostAndFound] = []
    var Data1 : [String] = ["poki"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return FoundController.Data.count
        
            return FoundController.Data.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"mCellFound")
        let contentView = cell?.contentView
        let label = contentView?.viewWithTag(2) as! UITextView
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        
      //  label.text = Data1[indexPath.row]
        label.text = FoundController.Data[indexPath.row].Desc
        print(FoundController.Data[indexPath.row].Desc)
        imageView.image = UIImage(named:"poki")
       // imageView.image = UIImage(named: Data[indexPath.row].)
        
    return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FoundController.Data.count)
        
    }
    
    
   

}
