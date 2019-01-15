//
//  BaseApi.swift
//  GMERemittance
//
//  Created by gme_2 on 22/08/2018.
//  Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

protocol ApiServiceType {
    var auth: Auth {get}
    var baseUrl: String  {get}
}

extension ApiServiceType {
    var auth: Auth {return Auth.sharedInstance}
    var baseUrl: String {return Auth.sharedInstance.baseUrl}
}



// repeated things in api
//
//if (response.errorCode ?? "") == "1" {
//    let error = NSError.init(domain: "Network", code: 0, userInfo: [NSLocalizedDescriptionKey : response.message ?? ""])
//    failure(error)
//}else {
//    let model = response.data
//    success(model)
//}


//class UserContainer: Mappable {
//    var errorCode: String?
//    var message: String?
//    var id: String?
//    var data: User?
//    
//    required init?(map: Map) {
//        
//    }
//    
//    func mapping(map: Map) {
//        errorCode <- map["ErrorCode"]
//        message <- map["Msg"]
//        id <- map["Id"]
//        data <- map["Data"]
//    }
//}
