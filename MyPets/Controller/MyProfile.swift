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
        // Do any additional setup after loading the view.
        
        
    }
}
