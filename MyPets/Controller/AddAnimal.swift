//
//  AddAnimal.swift
//  MyPets
//
//  Created by rim on 12/13/20.
//

import Foundation
import UIKit
import Alamofire

class AddAnimal : UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 

    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var race: UITextField!
 
    
    @IBOutlet weak var uploadImage: UIImageView!
    	
    @IBOutlet weak var btnbrid: UIButton!
    @IBOutlet weak var btndog: UIButton!
    @IBOutlet weak var btncat: UIButton!
    @IBAction func cat(_ sender: UIButton) {
        
        if sender.isSelected{
        sender.isSelected = false
        btndog.isSelected = false
        btnbrid.isSelected = false
    } else {
        btndog.isSelected = false
        btnbrid.isSelected = false
        btncat.isSelected = true
    }
        
       
    }
    
    @IBAction func dog(_ sender: UIButton) {
        if sender.isSelected{
        sender.isSelected = false
        btndog.isSelected = false
        btnbrid.isSelected = false
    } else {
        btndog.isSelected = true
        btnbrid.isSelected = false
        btncat.isSelected = false
    }
    }
    
    
    @IBAction func brid(_ sender: UIButton) {
        
        if sender.isSelected{
        sender.isSelected = false
        btndog.isSelected = false
        btncat.isSelected = false
    } else {
        btndog.isSelected = false
        btnbrid.isSelected = true
        btncat.isSelected = false
    }
    }
    
    
    
    
    
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
   
    
    
    
    @IBAction func Upload(_ sender: Any) {
       // UploadImage()
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
     //  presentViewController(imagePicker, animated: true, completion: nil)
     
    }
   
        
    
    
   
    
    
   
    
    @IBAction func AddAnimal(_ sender: Any) {
        var type : String?
        var b = true
        
        if (btncat.isSelected == true){
            print("cat")
              type = "cat"
        } else if (btndog.isSelected == true){
            print("Dog")
             type = "dog"
        } else if (btnbrid.isSelected == true){
            print("Brid")
            type = "brid"
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
        if b {
            addAnimal(Name: name.text!, Type: type!, Race: race.text!, Image: "uploadImage")
        }
    }
  
    
    
    
    
    
    
    
    
    func  addAnimal (Name : String  , Type:String, Race:String, Image: String) {
        let id = UserDefaults.standard.string(forKey: "id")
        print(id)
        
        let  data : [String:Any] = ["Name" : Name, "Image": Image,"IdUser" : id,"Type": Type,"Race":Race]
    
        AF.request(BASE_URL+"animal/add", method: .post, parameters: data, encoding: JSONEncoding.default)
               .responseString { response in
               switch (response.result){
               case .success(let responseString):
                   print(responseString)
                   let animalR = AnimalsResponse(JSONString: "\(responseString)")
                if((animalR?.success!) != false){
                    let anim = animalR?.Animal
                    MyAnimals.ListAnimals()
                    print(animalR!)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let found = storyBoard.instantiateViewController(withIdentifier: "MyAnimals") as! MyAnimals
                    self.present(found, animated: true, completion: nil)
                 
                    
                }
               case .failure(let error):
                   print(error)
               }
           }
 
}
    
    
    func UploadImage(){
                 // your image from Image picker, as of now I am picking image from the bundle
                 let image = UIImage(named: "poki",in: Bundle(for: type(of:self)),compatibleWith: nil)
             //   let image = picture.image
                let imageData = image?.jpegData(compressionQuality: 0.7)

        let url =  "https://mypetsback.herokuapp.com/uploadfile"
                 var urlRequest = URLRequest(url: URL(string: url)!)

                 urlRequest.httpMethod = "post"
                 let bodyBoundary = "--------------------------\(UUID().uuidString)"
                 urlRequest.addValue("multipart/form-data; boundary=\(bodyBoundary)", forHTTPHeaderField: "Content-Type")
               
                 //attachmentKey is the api parameter name for your image do ask the API developer for this
                // file name is the name which you want to give to the file
                 let requestData = createRequestBody(imageData: imageData!, boundary: bodyBoundary, attachmentKey: "file", fileName: "file.jpg")
                 
                 urlRequest.addValue("\(requestData.count)", forHTTPHeaderField: "content-length")
                 urlRequest.httpBody = requestData

                 URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                     if(error == nil && data != nil && data?.count != 0)
                     {
                         do {
                            /*
                             let response = try JSONDecoder().decode(ImageResponse.self, from: data!)
 */
                        let  response = ImageResponse(JSONString: "\(data)")
                             print(response)
                         }

                         catch let decodingError
                         {
                             debugPrint(decodingError)
                         }
                     }
                 }.resume()
             }
            
            
            func createRequestBody(imageData: Data, boundary: String, attachmentKey: String, fileName: String) -> Data{
                    let lineBreak = "\r\n"
                    var requestBody = Data()

                    requestBody.append("\(lineBreak)--\(boundary + lineBreak)" .data(using: .utf8)!)
                    requestBody.append("Content-Disposition: form-data; name=\"\(attachmentKey)\"; filename=\"\(fileName)\"\(lineBreak)" .data(using: .utf8)!)
                    requestBody.append("Content-Type: image/jpeg \(lineBreak + lineBreak)" .data(using: .utf8)!) // you can change the type accordingly if you want to
                    requestBody.append(imageData)
                    requestBody.append("\(lineBreak)--\(boundary)--\(lineBreak)" .data(using: .utf8)!)

                    return requestBody
                }
    
    
    
    
 
}
    

