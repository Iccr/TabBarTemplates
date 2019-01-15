//
//  RegisterRequestModel.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation


protocol Serializer {
    func serialize() -> [String: String]
}

class RegisterRequestModel: Serializer {
    var username: String?
    var password: String?
    var confirmPassword: String?
    var clientId: String?
    var uuid: String?
    var appVersion: String?
    var phoneBrand: String?
    var phoneOs: String?
    var fcmId: String? // device id
    var osVersion: String?
    var dob: String?
    
    func serialize() -> [String : String] {
        var dict = ["":""]
        dict["username"] = self.username ?? ""
        dict["password"] = self.password ?? ""
        dict["clientId"] = self.clientId ?? ""
        dict["uuid"] = self.uuid ?? ""
        dict["appVersion"] = self.appVersion ?? ""
        dict["phoneBrand"] = self.phoneBrand ?? ""
        dict["phoneOs"] = self.phoneOs ?? ""
        dict["fcmId"] = self.fcmId ?? ""
        dict["osVersion"] = self.osVersion ?? ""
        dict["Dob"] = self.dob ?? ""
        return dict
    }
}



