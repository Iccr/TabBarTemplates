//
//  GlobalConstants.swift
//  TabController
//
//  Created by shishir sapkota on 4/4/18.
//Copyright © 2018 ccr. All rights reserved.
//

import Foundation

// MARK: Constants
struct GlobalConstants {
    
    struct UserDefaultKeys {
        static let userLastAttendedEmail: String = "USER_LAST_ATTENDED_EMAIL"
        static let appInfo: String = "APP_INFO_DATA"
        static let agreedToEULA = "HAS_USER_AGREED_TO_EULA"
    }
    
    struct Notification {
        let name: String
        
        func fire(withObject object: Any? = nil) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: self.name), object: object)
        }
        
        static let statusCodeNeedsToBeHandled: Notification = Notification(name: "STATUS_CODE_NEEDS_TO_BE_HANDLED")
    }
    
    struct Errors {
        static let internetConnectionOffline = NSError.init(domain: "No_internet", code: 1234, userInfo: [NSLocalizedDescriptionKey: "info_no_internet".localized()])
        static let oops = NSError.init(domain: "oops", code: 1235, userInfo: [NSLocalizedDescriptionKey: "text_something_went_wrong".localized()])
    }
}
