//
//  AnimalsResponse.swift
//  MyPets
//
//  Created by rim on 12/13/20.
//

import Foundation
import ObjectMapper

class AnimalsResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var Animal : Animal?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        Animal <- map["Animal"]
    }
    
}

class Animal : Mappable {
    var id:String?
    var IdUser:String?
    var `Type`:String?
    var Name:String?
    var Race:String?
    var Image:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        IdUser <- map["IdUser"]
        id <- map["_id"]
        Type <- map["Type"]
        Name <- map["Name"]
        Race <- map["Race"]
        Image <- map["Image"]
    }
    
    
}
class ListAnimal :Mappable{
    var success :Bool?
    var message : String?
    var Animal : [Animal]?
   
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        Animal <- map["Animal"]
    }
    
    
    
}

