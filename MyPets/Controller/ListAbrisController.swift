//
//  ListAbrisController.swift
//  MyPets
//
//  Created by oussama on 12/14/20.
//

import UIKit
import Alamofire
import SideMenu

class ListAbrisController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    static var Data : [profile] = []
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController())
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
    }
    
    
    @IBAction func menu(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListVetoController.Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"mCellAbri")
        let contentView = cell?.contentView
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        let name = contentView?.viewWithTag(2) as! UILabel
        let address = contentView?.viewWithTag(3) as! UILabel
        let phone = contentView?.viewWithTag(4) as! UILabel
        
      //  label.text = Data1[indexPath.row]
        address.text = ListVetoController.Data[indexPath.row].Adresse
        name.text = ListVetoController.Data[indexPath.row].IdUser
        phone.text = ListVetoController.Data[indexPath.row].telephone
      //  print(ListVetoController.Data[indexPath.row].Adresse)
        imageView.image = UIImage(named:"poki")
       // imageView.image = UIImage(named: Data[indexPath.row].)
        
    return cell!
    }
    
    
    static func  ListAbris () {
        
     //   let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"veterinaire/list", method: .post,  encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                 //  print(responseString)
                   let profils = ListProfileResponse(JSONString: "\(responseString)")
                if((profils?.success!) != false){
                    let profile = profils?.profile
                   // print(foundR?.count)
                  //  self.Data=foundR!
                    ListVetoController.Data.removeAll()
                    for p in profile! {
                        print(p)
                        ListVetoController.Data.append(p)
                    }
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
    
    
}
