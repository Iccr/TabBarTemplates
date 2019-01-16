//
//  SearchModel.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation
import ObjectMapper


class SearchContainer: Mappable {
    var errorCode: String?
    var message: String?
    var id: String?
    var data: [Vehicle]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errorCode <- map["ErrorCode"]
        message <- map["Msg"]
        id <- map["Id"]
        data <- map["Data"]
    }
}

class Vehicle: Mappable {
    

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {

    }
}




