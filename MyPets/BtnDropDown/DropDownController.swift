//
//  DropDownController.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//

import UIKit
import DropDown

class DropDownController : UIViewController {
    
    @IBAction func Menu(_ sender: Any) {
    }
    
    let dropDown = DropDown() //2
      
      override func viewDidLoad() {
        super.viewDidLoad()
      }
      
      @IBAction func tapChooseMenuItem(_ sender: UIButton) {//3
        dropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal) //9
        }
      }
}
