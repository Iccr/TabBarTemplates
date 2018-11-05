//
//  Item.swift
//  TabController
//
//  Created by shishir sapkota on 11/6/18.
//  Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import ObjectMapper


//var categories = ""
//var size = ""
//var color = ""
//var name = ""




class Item: Mappable {
    var name: String?
    var id: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
}




class Styles {
    var name: String?
    var size: String?
}
