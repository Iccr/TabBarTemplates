//
//  ExtensionJSON.swift
//  GMERemittance
//
//  Created by gme_2 on 22/08/2018.
//  Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

extension JSON {
    func map<T: Mappable>() -> [T]? {
        let json = self.array
        let mapped: [T]? = json?.compactMap({$0.map()})
        return mapped
    }
    
    func map<T: Mappable>() -> T? {
        let obj: T? = Mapper<T>().map(JSONObject: self.object)
        return obj
    }
}
