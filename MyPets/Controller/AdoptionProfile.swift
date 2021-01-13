//
//  AdoptionProfile.swift
//  MyPets
//
//  Created by oussama on 1/12/21.
//

import UIKit

class AdoptionProfile : UIViewController {
    
    var adoption : Adoption? = nil
    var UserDet : Any? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  imageAdop.image = UIImage(named: "poki")
        nameAdop.text = adoption?.nameAnimal
        DescAdop.text = adoption?.Description
        
        
    }
    
    
    
    @IBOutlet weak var imageAdop: UIImageView!
    
    
    @IBOutlet weak var nameAdop: UITextView!
    
    
    @IBOutlet weak var DescAdop: UITextView!
    
    
    
    
    
}
