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
    
   private var menuItems : [String] = ["Home","Profile","Lost","Found","Veterinarians","Shelters","Logout"]
    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    let userDefaults = UserDefaults.standard
 
    init() {
        super.init(nibName: nil, bundle: nil)
    
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        MyAnimals.ListAnimals()
        ListVetoController.ListVeto()
        ListAbrisController.ListAbris()
        ViewController.ListFound()
        ViewController.ListLost1()
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
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let mainhome = storyBoard.instantiateViewController(withIdentifier: "MainHomeController") as! MainHomeController
            self.present(mainhome, animated:true, completion:nil)
        }else  if(indexPath.row == 1){
            print(indexPath.row)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myprofile = storyBoard.instantiateViewController(withIdentifier: "MyProfile") as! MyProfile
            self.present(myprofile, animated: true, completion: nil)
        }else if(indexPath.row == 2){
            print(indexPath.row)
            ViewController.ListLost1()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let lost = storyBoard.instantiateViewController(withIdentifier: "LostController") as! LostController
            self.present(lost, animated: true, completion: nil)
            
        }else if(indexPath.row == 3){
            print(indexPath.row)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let found = storyBoard.instantiateViewController(withIdentifier: "FoundController") as! FoundController
            self.present(found, animated: true, completion: nil)
        }else if(indexPath.row == 4){
            print(indexPath.row)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let found = storyBoard.instantiateViewController(withIdentifier: "ListVeto") as! ListVetoController
            self.present(found, animated: true, completion: nil)
        }else if(indexPath.row == 5){
            print(indexPath.row)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let found = storyBoard.instantiateViewController(withIdentifier: "ListAbris") as! ListAbrisController
            self.present(found, animated: true, completion: nil)
        }
        else if(indexPath.row == 6){
            print(indexPath.row)
            
            let domain = Bundle.main.bundleIdentifier!
            userDefaults.removePersistentDomain(forName: domain)
            userDefaults.synchronize()
            print(Array(userDefaults.dictionaryRepresentation().keys).count)
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let found = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(found, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    
}
