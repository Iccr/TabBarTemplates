//
//  Style.swift
//  TabController
//
//  Created by gme_2 on 06/11/2018.
//  Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import ObjectMapper



class Style {
    var id: Int?
    var color: String?
    var sizes: [Size] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        color <- map["name"]
        id <- map["id"]
        sizes <- map["sizes"]
    }
    
}


class Size: Mappable {
    var name: String?
    var id: Int?
    var stockLevel: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        stockLevel <- map["stock_level"]
    }
}


class StyleContainer: Mappable {
    var data: [Style] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["styles"]
    }
}
