//
//  User.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import Foundation
import ObjectMapper


class UserContainer: Mappable {
    var errorCode: String?
    var message: String?
    var id: String?
    var data: User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errorCode <- map["ErrorCode"]
        message <- map["Msg"]
        id <- map["Id"]
        data <- map["Data"]
    }
}

class User: Mappable {
    
    var userId: String?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var nickName: String?
    var email: String?
    var mobileNumber: String?
    var rewardPoint: String?
    var walletNumber: String?
    var availableBalance: String?
    var yearlyLimit: String?
    var accessCode: String?
    var pennyTestStatus: String?
    var dpUrl: String?
    var kyc: Bool?
    var verified: Bool?
    var active: Bool?
    var primaryBankName: String?
    var primaryAccountNumber: String?
    var cmRegistrationId: String?
    var isReferred: Bool?
    var country: String?
    var dateOfBirth: String?
    var province: String?
    var provinceId: String?
    var sourceId: String?
    var idType: String?
    var idNumber: String?
    var senderId: String?
    var countryCode: String?
    var ErrorCode: String?
    var Msg: String?
    var Id: String?
    var kftcClientId: String?
    var Data: String?
    var platforms: [Platform] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId    <- map["userId"]
        firstName    <- map["firstName"]
        middleName    <- map["middleName"]
        lastName    <- map["lastName"]
        nickName    <- map["nickName"]
        email    <- map["email"]
        mobileNumber    <- map["mobileNumber"]
        rewardPoint    <- map["rewardPoint"]
        walletNumber    <- map["walletNumber"]
        availableBalance    <- map["availableBalance"]
        accessCode    <- map["accessCode"]
        dpUrl    <- map["dpUrl"]
        dateOfBirth <- map["Dob"]
        platforms <- map["appUpdate"]
        kyc    <- map["kyc"]
        yearlyLimit <- map["yearlyLimit"]
        verified    <- map["verified"]
        active    <- map["active"]
        primaryBankName    <- map["primaryBankName"]
        primaryAccountNumber <- map["primaryBankAccount"]
        cmRegistrationId    <- map["cmRegistrationId"]
        isReferred    <- map["isReferred"]
        country    <- map["country"]
        province    <- map["province"]
        provinceId    <- map["provinceId"]
        sourceId <- map["sourceId"]
        idType    <- map["idType"]
        idNumber    <- map["idNumber"]
        countryCode    <- map["countryCode"]
        senderId <- map["senderId"]
        ErrorCode    <- map["ErrorCode"]
        Msg    <- map["Msg"]
        Id    <- map["Id"]
        Data    <- map["Data"]
        kftcClientId <- map["kftcClientId"]
        pennyTestStatus <- map["pennyTestStatus"]
    }
}


class Platform: Mappable {
    var info: String?
    var os: String?
    var build: String?
    var version: String?
    var critical: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        info <- map["Info"]
        build <- map["Build"]
        version <- map["Version"]
        os <- map["OS"]
        critical <- map["Critical"]
    }
}











