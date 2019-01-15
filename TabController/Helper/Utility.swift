//
//  Utility.swift
//  TabController
//
//  Created by gme_2 on 15/01/2019.
//  Copyright © 2019 ccr. All rights reserved.
//

import UIKit

enum Devices {
    case iphone5
    case iphone678
    case iphone678Plus
    case iphoneX
    case ipad
    case other
}

class Utility {
    static func getDeviceModel() -> Devices {
    
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return .iphone5
            case 1334:
                return .iphone678
            case 2208:
                return .iphone678Plus
            case 2436:
                return .iphoneX
            default:
                return .other
            }
        }else {
            return .ipad
        }
    }
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    
    static func getAppVersion () -> String? {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        print(version)
        return version
    }
    
    static func getOsVersion() -> String {
        let version = UIDevice.current.systemVersion
        return version
    }
    
    static func getPhoneBrand() -> String {
        let phoneName = UIDevice.current.model
        return phoneName
    }
    
    static func getPhoneOs() -> String {
        let os = UIDevice.current.systemName
        return os
    }
    
    static func getUUid() -> String? {
        let uuid =  UIDevice.current.identifierForVendor?.uuidString
        return uuid
    }
    
    static func getCliendId() -> String {
        return ""
    }
}
