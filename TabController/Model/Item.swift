//
//  Item.swift
//  TabController
//
//  Created by shishir sapkota on 11/6/18.
//  Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import ObjectMapper


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

class JacketsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        data <- map["products_and_categories.Jackets"]
    }
}


class PantsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Pants"]
    }
}

class ShirtsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Shirts"]
    }
}

class SweatshirtsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Sweatshirts"]
    }
}

class TopsSweatersContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Tops/Sweaters"]
    }
}

class HatsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Hats"]
    }
}


class AccessoriesContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.Accessories"]
    }
}

class NewContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["products_and_categories.new"]
    }
}

class Styles {
    var name: String?
    var size: String?
}
