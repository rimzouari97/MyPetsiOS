//
//  LostAndfoundResponse.swift
//  MyPets
//
//  Created by oussama on 12/7/20.
//

import Foundation
import ObjectMapper

class LostAndFoundResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var LostAndFound : LostAndFound?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        LostAndFound <- map["LostAndFound"]
    }
    
}

class LostAndFound :Mappable{
    var  id :String?
    var  IdUser:String?
    var  `Type`:String?
    var  ImageAnimal:String?
    var  Desc: String?
    var  Date:String?
    var  valide:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        IdUser <- map["IdUser"]
        id <- map["_id"]
        Type <- map["Type"]
        ImageAnimal <- map["ImageAnimal"]
        Desc <- map["Desc"]
        Date <- map["Date"]
        valide <- map["valide"]
    }
    
    
    
}

class ListLostAndFound :Mappable{
    var success :Bool?
    var message : String?
    var LostAndFound : [LostAndFound]?
   
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        LostAndFound <- map["lostAndFound"]
    }
    
    
    
}
