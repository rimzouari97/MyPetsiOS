//
//  MainHome.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import Foundation


 class MainHomeController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var menu : SideMenuNavigationController?
    
    var animals = [""]
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var hometable: UITableView!
    
    @IBAction func filter(_ sender: Any) {
        performSegue(withIdentifier: "FilterSegue", sender: "nil")
    }
  
    @IBAction func Menu(_ sender: Any) {
        
        performSegue(withIdentifier: "menu", sender: "nil")
        //present(menu!, animated: true)
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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = UserDefaults.standard.string(forKey: "name")
        print(name!)
        // Do any additional setup after loading the view.
        
        //menu = SideMenuNavigationController(rootViewController: UIViewController())
    }
   
}
