//
//  SearchRequestModel.swift
//  TabController
//
//  Created by gme_2 on 16/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation


enum TravelDirection: String {
    case oneWay = "one way"
    case twoWay = "two way"
}

class SearchRequestModel: Serializer {
   
    var from: String?
    var to: String?
    var checkInDate: String?
    var checkOutDate: String?
    var direction:TravelDirection?
    var numberOfPassengers: String? = "1"
    var numberOfRooms: String? = "1"
    
    func serialize() -> [String : String] {
        var dict = ["":""]
        dict["from"] = self.from ?? ""
        dict["to"] = self.to ?? ""
        dict["checkIn"] = self.checkInDate ?? ""
        dict["checkOut"] = self.checkOutDate ?? ""
        dict["numberOfPassengers"] = self.numberOfPassengers ?? ""
        dict["numberOfRooms"] = self.numberOfRooms ?? ""
        if let number = self.numberOfPassengers {
            dict["direction"] = number
        }
        return dict
    }
}



