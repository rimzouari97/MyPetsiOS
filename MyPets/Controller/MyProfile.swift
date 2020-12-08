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
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController())
   
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        // Do any additional setup after loading the view.
        
    }
}
