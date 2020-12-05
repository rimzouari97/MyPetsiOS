//
//  Register.swift
//  MyPets
//
//  Created by rim on 11/21/20.
//

import UIKit
import Alamofire
import Foundation
class RegisterController : UIViewController {

    let userDefaults = UserDefaults.standard
    var res = false
    @IBOutlet weak var volunteerBtn: UIButton!
    
    @IBOutlet weak var veterinarianBtn: UIButton!
    
    @IBOutlet weak var shelterBtn: UIButton!
    
    @IBAction func volunteerBtnAction(_ sender: UIButton) {if sender.isSelected{
        sender.isSelected = false
        veterinarianBtn.isSelected = false
        shelterBtn.isSelected = false
    } else {
        sender.isSelected = true
        veterinarianBtn.isSelected = false
        shelterBtn.isSelected = false
    }
    }
    
    @IBAction func veterinarianBtnAction(_ sender: UIButton) {if sender.isSelected{
        sender.isSelected = false
        volunteerBtn.isSelected = false
        shelterBtn.isSelected = false
    } else {
        sender.isSelected = true
        volunteerBtn.isSelected = false
        shelterBtn.isSelected = false
    }
    }
  
    @IBAction func shelterBtnAction(_ sender: UIButton) {if sender.isSelected{
        sender.isSelected = false
        volunteerBtn.isSelected = false
        veterinarianBtn.isSelected = false
    } else {
        sender.isSelected = true
        volunteerBtn.isSelected = false
        veterinarianBtn.isSelected = false
    }
    }
    
   
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }
    
    func validetion() -> Bool {
        if(Name.text?.isEmpty == true){
            self.view.makeToast("UserName is required", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            return false
        }else if (Email.text?.isEmpty == true){
            self.view.makeToast("Email is required", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            
            return false
        }else if (Password.text?.isEmpty == true){
            self.view.makeToast("Password is required", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            return false
        }else if (ConfirmPassword.text?.isEmpty == true){
            self.view.makeToast("Confirm Password is required", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            return false
        }else if (Password.text?.elementsEqual(ConfirmPassword.text!) == false){
            self.view.makeToast("Password and Confirm password not Equals", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            return false
        }
        return true
    }
    
    @IBAction func signup(_ sender: Any) {
        var Type : String?
        var b = true
        
        if (volunteerBtn.isSelected == true){
              Type! = "volunteer"
        } else if (shelterBtn.isSelected == true){
             Type = "shelter"
        } else if (veterinarianBtn.isSelected == true)
        {  Type! = "veterinarian"
        }else {
            b = false
            self.view.makeToast("Category is required", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
        
        if (self.validetion() == true && b == true) {
        Register(name: Name.text!, email: Email.text!, password: Password.text!, type: Type!)
          if(self.res == true){
          performSegue(withIdentifier: "signUp", sender: "nil")
          }
          
          else{
              self.view.makeToast("Invalid", duration: 2.0, point: CGPoint(x: 200.0, y: 750.0), title: "Alert", image: UIImage(named: "logo.png")) { didTap in
                  if didTap {
                      print("completion from tap")
                  } else {
                      print("completion without tap")
                  }
              }
      }
    }
   
    }
   
    func  Register (name: String, email : String  , password:String, type: String) {
        let  data : [String:Any] = ["name" : name ,"email" : email, "password": password, "type": type]
        userDefaults.object(forKey: "name")
        userDefaults.object(forKey: "email")
        userDefaults.object(forKey: "password")
        userDefaults.object(forKey: "type")
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(BASE_URL+"users/register", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let userR = UserResponse(JSONString: "\(responseString)")
                if((userR?.success!) != false){
                let user = userR?.user
                    self.userDefaults.setValue(user?.name, forKey: "name")
                    print(userR?.success!)
                    self.res = true
                }
               case .failure(let error):
                   print(error)
               }
           }
  
    
}
}
