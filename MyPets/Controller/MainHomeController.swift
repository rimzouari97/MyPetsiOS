//
//  MainHome.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit

 class MainHomeController : UIViewController/*,UITableViewDataSource, UITableViewDelegate*/{
    
    var animals = [""]
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var hometable: UITableView!
    
    @IBAction func filter(_ sender: Any) {
        performSegue(withIdentifier: "FilterSegue", sender: "nil")
    }
  
    @IBAction func Menu(_ sender: Any) {
        
        performSegue(withIdentifier: "menu", sender: "nil")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
   /* func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Acell")
        let contentView = cell?.contentView
        let textView = contentView?.viewWithTag(1) as! UITextView
        let imageView = contentView?.viewWithTag(2) as! UIImageView
        
        textView.text = animals[indexPath.row]
        imageView.image = UIImage(named: animals[indexPath.row])
        
        
        return cell!
    }
    */
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
    }
    
    

    

    
    
}
