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

class MappableDict: Mappable {
    var dict: [String: Any] = [:]
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        dict <- map["products_and_categories"]
    }
    
}

class AllItemsList: Mappable {
    var jackets: [JacketsContainer] = []
    var pants: [PantsContainer] = []
    var shirts: [ShirtsContainer] = []
    var sweatShirts: [SweatshirtsContainer] = []
    var topsSweaters: [TopsSweatersContainer] = []
    var hats: [HatsContainer] = []
    var accessories: [AccessoriesContainer] = []
    var new: [NewContainer] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        jackets <- map["products_and_categories.Jackets"]
        pants <- map["products_and_categories.Pants"]
        shirts <- map["products_and_categories.Shirts"]
        sweatShirts <- map["products_and_categories.Sweatshirts"]
        topsSweaters <- map["products_and_categories.Sweaters"]
        hats <- map["products_and_categories.Hats"]
        accessories <- map["products_and_categories.Accessories"]
        new <- map["products_and_categories.new"]
    }
}


class JacketsContainer: Mappable {
    
    var data: [Item] = []
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        data <- map["Jackets"]
    }
}


class PantsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Pants"]
    }
}

class ShirtsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Shirts"]
    }
}

class SweatshirtsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Sweatshirts"]
    }
}

class TopsSweatersContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Tops/Sweaters"]
    }
}

class HatsContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Hats"]
    }
}


class AccessoriesContainer: Mappable {
    var data: [Item] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["Accessories"]
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
