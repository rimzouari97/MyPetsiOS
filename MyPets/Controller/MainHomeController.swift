//
//  MainHome.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import SideMenu
import EventKitUI
import Alamofire


class MainHomeController : UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    static var Data : [Adoption] = []
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var hometable: UITableView!
    
    @IBAction func filter(_ sender: Any) {
        performSegue(withIdentifier: "FilterSegue", sender: "nil")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainHomeController.Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Acell")
        let contentView = cell?.contentView
        let textView = contentView?.viewWithTag(3) as! UITextView
        let label = contentView?.viewWithTag(2) as! UILabel
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        
//        textView.text = MainHomeController.Data[indexPath.row].Description!
        imageView.image = UIImage(named: "poki")
        label.text = MainHomeController.Data[indexPath.row].nameAnimal!
        
        return cell!
    }

    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController())
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
  
        let name = UserDefaults.standard.string(forKey: "name")
        print("this user Defaults : " + name!)
        // Do any additional setup after loading the view.
      
        
    }
    
    @IBAction func Menu(_ sender: Any) {
        
        present(sideMenu, animated: true)
    
    }
    
    
    static func  ListAdoption () {
        
        AF.request(BASE_URL+"adoption/list", method: .post,  encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let adoptions = ListAdoptionsResponse(JSONString: "\(responseString)")
                if((adoptions?.success!) != false){
                let adopt = adoptions?.adoptions
                    print(adopt?.count)
                  //  self.Data=foundR!
                    MyAnimals.Data.removeAll()
                    for ado in adopt! {
                        print(ado)
                        MainHomeController.Data.append(ado)
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
