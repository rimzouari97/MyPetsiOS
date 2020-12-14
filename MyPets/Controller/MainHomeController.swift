//
//  MainHome.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import SideMenu
import EventKitUI


class MainHomeController : UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
   
    //var menu : SideMenuNavigationController?
    
  
    var animals = [""]
    

    
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var hometable: UITableView!
    
    @IBAction func filter(_ sender: Any) {
        performSegue(withIdentifier: "FilterSegue", sender: "nil")
    }
  
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func numberOfSections (in tableView: UITableView) -> Int {
        return 1
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Acell")
       /* let contentView = cell?.contentView
        let textView = contentView?.viewWithTag(1) as! UITextView
        let imageView = contentView?.viewWithTag(2) as! UIImageView
        
        textView.text = animals[indexPath.row]
        imageView.image = UIImage(named: animals[indexPath.row])
        */
        return cell!
    }

    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController())
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        //ListVetoController.ListVito()
        let name = UserDefaults.standard.string(forKey: "name")
        print("this user Defaults : " + name!)
        // Do any additional setup after loading the view.
      
        
    }
    
    @IBAction func Menu(_ sender: Any) {
        
        present(sideMenu, animated: true)
    
    }
  
   
}
