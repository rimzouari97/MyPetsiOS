//
//  DropDownTable.swift
//  MyPets
//
//  Created by rim on 11/28/20.
//
import UIKit
import DropDown

class DropDownTable : UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
      let dropDown = DropDown()
      
      override func viewDidLoad() {
        super.viewDidLoad()
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "movie \(indexPath.row+1): "
        return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
          dropDown.dataSource = ["Inception", "Avatar", "Joker", "Avengers: Endgame", "Interstellar", "Gravity"]
          dropDown.anchorView = cell
          dropDown.bottomOffset = CGPoint(x: 0, y: cell.frame.size.height)
          dropDown.backgroundColor = .orange
          dropDown.show()
          dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            cell.textLabel?.text = "movie \(indexPath.row+1): \(item)"
          }
        }
      }}

