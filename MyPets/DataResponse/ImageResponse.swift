//
//  ImageResponse.swift
//  MyPets
//
//  Created by oussama on 1/13/21.
//

import Foundation
import ObjectMapper

class ImageResponse :Mappable {
    var filename :String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        filename <- map["filename"]
    }
}
