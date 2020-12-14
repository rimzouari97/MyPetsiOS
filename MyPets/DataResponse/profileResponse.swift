//
//  profileResponse.swift
//  MyPets
//
//  Created by oussama on 12/13/20.
//

import Foundation

import ObjectMapper

class profileResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var profile : profile?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        profile <- map["volontaires"]
        profile <- map["veterinaires"]
        profile <- map["abris"]
    }
    
}

class profile :Mappable{
    
   var IdUser:String?
   var image:String?
   var telephone:String?
   var Adresse:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        IdUser <- map["IdUser"]
        image <- map["image"]
        telephone <- map["telephone"]
        Adresse <- map["Adresse"]
    }
    
    
    
}

class ListProfileResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var profile : [profile]?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        profile <- map["volontaires"]
        profile <- map["veterinaires"]
        profile <- map["abris"]
    }
    
}
