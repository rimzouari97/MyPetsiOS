//
//  MyProfile.swift
//  MyPets
//
//  Created by rim on 12/5/20.
//

import Foundation
import UIKit
import SideMenu

class MyProfile: UIViewController{
    
    
    @IBOutlet weak var bar: UINavigationBar!
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController())
 
    @IBOutlet weak var descrip: UITextView!
    
    @IBAction func menu(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
    @IBAction func MyAnimals(_ sender: Any) {
        performSegue(withIdentifier: "MyAnimals", sender: "nil")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        //descrip.text = UserDefaults.standard.string(forKey: "name")
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var namepic: UILabel!
    
    @IBAction func addanim(_ sender: Any) {
    }
    @IBAction func addfav(_ sender: Any) {
    }
    
    
}
