//
//  LostController.swift
//  MyPets
//
//  Created by oussama on 12/5/20.
//

import UIKit

class LostController :UIViewController,UITableViewDataSource,UITableViewDelegate{
    
   // var Data : [String] = ["poki","poki"]
    static var Data : [LostAndFound] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LostController.Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"mCellLost")
        let contentView = cell?.contentView
        let label = contentView?.viewWithTag(2) as! UITextView
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        
        label.text = LostController.Data[indexPath.row].Desc
        
        imageView.image = UIImage(named: "poki")
        
      //  imageView.image = UIImage(named: Data[ indexPath.row])
        
    return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}
