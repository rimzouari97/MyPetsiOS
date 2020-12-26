//
//  AdotionResponse.swift
//  MyPets
//
//  Created by rim on 12/15/20.
//

import Foundation
import ObjectMapper

class AdoptionResponse :Mappable {
  
    var success :Bool?
    var message : String?
    var adoption : Adoption?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        adoption <- map["adoption"]
    }
    
}

class Adoption :Mappable{
    var  IdUser : String?
    var IdAnimal : String?
    var nameAnimal : String?
    var image : String?
    var Description : String?
    var valide : String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        IdUser <- map["IdUser"]
        IdAnimal <- map["IdAnimal"]
        nameAnimal <- map["nameAnimal"]
        image <- map["image"]
        Description <- map["Description"]
        valide <- map["valide"]
    }
    
    
    
}

class ListAdoptionsResponse :Mappable{
    var success :Bool?
    var adoptions : [Adoption]?
   
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        adoptions <- map["adoptions"]
    }
    
    
    
}

