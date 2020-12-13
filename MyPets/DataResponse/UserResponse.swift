//
//  UserResponse.swift
//  MyPets
//
//  Created by rim on 12/4/20.
//

import Foundation
import ObjectMapper

class UserResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var user : User?
    var token : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        user <- map["user"]
        token <- map["token"]
    }
    
}

class User :Mappable{
    var  name : String?
    var email : String?
    var type : String?
    var id : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        type <- map["type"]
        id <- map["_id"]
    }
    
    
    
}

class ListUser :Mappable{
    var success :String?
    var users : [User]?
   
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        users <- map["users"]
    }
    
    
    
}
