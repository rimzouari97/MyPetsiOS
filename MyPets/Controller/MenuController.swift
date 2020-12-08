//
//  MenuController.swift
//  MyPets
//
//  Created by rim on 12/6/20.
//

import Foundation
import UIKit
import SideMenu

class MenuController: UITableViewController{
    
   private var menuItems : [String] = ["Home","Profile","Lost","Found","Logout"]
    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
 
    init() {
        super.init(nibName: nil, bundle: nil)
    
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  tableView.deselectRow(at: indexPath, animated: true)
       // performSegue(withIdentifier: "mSeg", sender: indexPath)
      //  let  selectedItem  = menuItems[indexPath.row]
       // print(indexPath.row)
        if(indexPath.row == 0){
            print(indexPath.row)
            print(indexPath.row)
            let secondVC = storyboard?.instantiateViewController(identifier: "HomeController") as! HomeController
            self.present(secondVC, animated:true, completion:nil)
        }else  if(indexPath.row == 1){
           
        }else if(indexPath.row == 2){
            print(indexPath.row)
            print(indexPath.row)
            let secondVC = storyboard?.instantiateViewController(identifier: "MyProfile") as! MyProfile
            self.present(secondVC, animated:true, completion:nil)
        }else if(indexPath.row == 3){
            print(indexPath.row)
            print(indexPath.row)
            let secondVC = storyboard?.instantiateViewController(identifier: "MyProfile") as! MyProfile
            self.present(secondVC, animated:true, completion:nil)
        }else if(indexPath.row == 4){
            print(indexPath.row)
        }
        
    }
    
    
    
    
}
